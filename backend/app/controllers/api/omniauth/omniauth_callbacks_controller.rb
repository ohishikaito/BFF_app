class Api::Omniauth::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # def failure
  #   binding.pry
  #   set_flash_message! :alert, :failure, kind: OmniAuth::Utils.camelize(failed_strategy.name), reason: failure_message
  #   redirect_to after_omniauth_failure_path_for(resource_name)
  # end

  # def google_oauth2
  #   binding.pry
  #   # p(request.env["omniauth.auth"])
  #   # @user = User.find_for_google_oauth2(request.env["omniauth.auth"])

  #   # # 保存済みかどうかのチェック
  #   # if @user.persisted?
  #   #   flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
  #   #   sign_in_and_redirect @user, :event => :authentication
  #   # else
  #   #   session["devise.google_data"] = request.env["omniauth.auth"]
  #   #   redirect_to new_user_registration_url
  #   # end
  # end
end