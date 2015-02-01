class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id]["$oid"])
    end
  end
  
  helper_method :current_user

  def authorize
    redirect_to signup_path unless current_user
  end

  ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
    html_tag.html_safe
  end
end
