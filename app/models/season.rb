class Season < ApplicationRecord
  belongs_to :league
  has_many :matches
  has_many :standings

  validates :start_at, presence: true
  validates :end_at, presence: true
  validate :end_date_cannot_be_earlier_than_start_date

  def end_date_cannot_be_earlier_than_start_date
    if start_at.nil? || end_at.nil?
      return
    elsif Date.parse(end_at.to_s) < Date.parse(start_at.to_s)
      errors.add("End date cannot be earlier than start date") 
    end
  end

end
