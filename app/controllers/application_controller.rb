class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  

  def configure_permitted_parameters

    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :birthday, :gender_id, :form_id, :profession_name, :want_to_do, :can_do_list])
    devise_parameter_sanitizer.permit(:account_update, keys: [:password, :nickname, :birthday, :gender_id, :form_id, :profession_name, :want_to_do, :can_do_list])

  end
end
