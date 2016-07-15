class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #includes the session_helper.rb to be used widely 
  include SessionsHelper
  include ProjectsHelper

end
