module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def remember(user)
    user.remember_token = User.new_token
    user.update_attribute(:remember_digest, User.new_digest(user.remember_token))
    cookies.permanent.encrypted[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token    
  end

  def current_user
    if session[:user_id]
      if @current_user.nil?
        @current_user = User.find_by(id: session[:user_id])
      end
      return @current_user
    elsif cookies.signed[:user_id]
        user = User.find_by(id: cookies.encrypted[:user_id])
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end      
  end
    

  def is_logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    cookies.delete(:remember_token)
    @current_user.update_attribute(:remember_digest, nil)
    @current_user = nil
  end

end
