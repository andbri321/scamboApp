 class ApplicationController < ActionController::Base
  
  #pundit
  include Pundit
  
  #manages Pundit Errors
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #set layout
  layout :layout_by_resource
  
  protected

  def layout_by_resource
  	if devise_controller? && resource_name == :admin
  		"backoffice_devise"
  	else
  		"application"
  	end
  end

  def user_not_authorized
    flash[:alert] = "Você não está autirado a fazer esta ação !"
    redirect_to(request.referrer || root_path)
  end
end
