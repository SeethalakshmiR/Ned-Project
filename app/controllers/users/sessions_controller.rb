# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  # protected  
  def forgot_username
  end

  def send_username
    user = ::User.find_by(email: params[:email])
    if user&.valid_password?(params[:password])
      UserMailer.forgot_username(user).deliver_now
      redirect_to new_user_session_path, notice: t('devise.sessions.forgot_username_sent')
    else
      flash.now[:alert] = "Invalid email or password."
      render :forgot_username, notice: t('devise.failure.email_not_found')
    end
  end
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
