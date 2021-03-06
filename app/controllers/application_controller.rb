class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :current_user

  def new_user
    @new_user = User.new
  end

  helper_method :new_user

  def current_user
    @current_user ||= User.find(params[:user_id]) if params[:user_id]
  end

  helper_method :current_user

  def authenticate_user!
    unless current_user
      flash[:alert] = "You must be logged in to do that."
      return false
    end
    true
  end

  def current_user_an_admin?(user)
    if user[:admin]
      true
    else
      flash[:alert] = "Access Denied"
      redirect_to :back
    end
  end
end
