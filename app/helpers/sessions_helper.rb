module SessionsHelper
  def current_user
    # TODO chris jan 9, 2011 deal with case for deleted users more elegantly
    if session[:user_id]
      if @current_user
        return @current_user
      elsif User.exists?(:id => session[:user_id])
        @current_user = User.find(session[:user_id])
      else
        sign_out
      end
    end
  end

  def current_user=(user)
    @current_user = user
  end

  def sign_in(user)
    session[:user_id] = user.id
    self.current_user = user
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_out
    session[:user_id] = nil
    current_user = nil
  end

  def current_user?(user)
    user == current_user
  end

  def deny_access
    store_location
    redirect_to sign_in_path, :notice => "Please sign in to access this page."
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end

  def authenticate
    deny_access unless signed_in?
  end

  private
    def store_location
      session[:return_to] = request.fullpath
    end

    def clear_return_to
      session[:return_to] = nil
    end
end
