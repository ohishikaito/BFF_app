class Api::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  before_action :authenticate_api_user!, only: %i[account_update_params]

  private

    def sign_up_params
      params.permit(:name, :email, :company, :password, :password_confirmation)
    end

    def account_update_params
      params.permit(:name, :email, :company)
    end
end
