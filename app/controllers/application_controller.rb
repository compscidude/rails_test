class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  def hello
  end

  # Putting this line  (before_filter :authorize) inside a certain controller will force the user to login 
  
  def authorize
    redirect_to '/login' unless current_user
  end

end
