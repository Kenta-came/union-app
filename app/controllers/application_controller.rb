class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:password, :password_confirmation,:nickname, :birthday, :gender_id, :form_id, :profession_name, :want_to_do, :can_do_list])

  end
end
