class ApplicationController < ActionController::Base
  protect_from_forgery

  # Overriding the Devise current_user method
  # alias_method :devise_current_user, :current_user
  # def current_user    
  #   super.accountable
  # end

end
