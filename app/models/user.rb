class User < ApplicationRecord
  attr_accessor :remember_token
  
  before_save { self.email = email.downcase }

  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :profile_picture

  validates :username, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                                    format: { with: VALID_EMAIL_REGEX },
                                    uniqueness: true

  # validates :profile_picture, content_type: ['image/png', 'image/jpg', 'image/jpeg'],
  #                             size: { less_than: 5.megabytes, 
  #                             message: 'Image must be smaller than 5MB' }
                                    
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  def User.new_token
    SecureRandom.urlsafe_base64
  end
  
  def User.new_digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def is_authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

end
