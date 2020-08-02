# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  prepend_before_action :check_captcha, only: [:create]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    super

    if Rails.env.production?
      username = sign_up_params['username']
      password = sign_up_params['password']
      VersionInfo.execute <<-SQL
CREATE USER '#{username}' IDENTIFIED BY '#{password}';
GRANT DELETE, INSERT, SELECT, UPDATE ON `#{username}` TO '#{username}';
ALTER USER '#{username}' WITH MAX_QUERIES_PER_HOUR 60;
FLUSH PRIVILEGES;
SQL
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  def destroy
    if Rails.env.production?
      username = resource[:username]
      destroy_sql = "DROP USER '#{username}'"
      ActiveRecord::Base.connection.execute destroy_sql
    end

    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  private
  def check_captcha
    if Rails.env.production?
      unless verify_recaptcha
        self.resource = resource_class.new sign_up_params
        resource.validate # Look for any other validation errors besides reCAPTCHA
        set_minimum_password_length
        respond_with_navigational(resource) { render :new }
      end
    end
  end
end
