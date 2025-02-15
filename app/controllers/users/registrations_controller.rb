# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  prepend_before_action :check_captcha, only: [:create]

  # POST /resource
  def create
    super

    if Rails.env.production?
      username = sign_up_params['username']
      password = sign_up_params['password']
      ActiveRecord::Base.connection.exec_query "CREATE USER '#{username}'@'%' IDENTIFIED BY '#{password}';"
    end
  end

  # DELETE /resource
  def destroy
    if Rails.env.production?
      username = resource[:username]
      ActiveRecord::Base.connection.exec_query "DROP USER '#{username}'@'%';"
    end

    super
  end

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
