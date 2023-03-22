class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def after_sign_in_path_for(resource)
    user_categories_path(user_id: resource.id)
    # if request.referer == new_identity_session_url
    #   super
    # else
    #   stored_location_for(resource) || request.referer
    # end
  end
end
