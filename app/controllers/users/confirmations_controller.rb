# frozen_string_literal: true

class Users::ConfirmationsController < Devise::ConfirmationsController
  # GET /resource/confirmation/new
  # def new
  #   super
  # end

  # POST /resource/confirmation
  # def create
  #   super
  # end

  # GET /resource/confirmation?confirmation_token=abcdef
  def show
    super
    if Rails.env.production? and resource.errors.empty?
      username = resource[:username]
      ActiveRecord::Base.connection.exec_query "GRANT DELETE, INSERT, SELECT, UPDATE ON #{username}.* TO '#{username}'@'%';"
      ActiveRecord::Base.connection.exec_query "ALTER USER '#{username}'@'%' WITH MAX_QUERIES_PER_HOUR 40;"
      ActiveRecord::Base.connection.exec_query "FLUSH PRIVILEGES;"
    end
  end

  # protected

  # The path used after resending confirmation instructions.
  # def after_resending_confirmation_instructions_path_for(resource_name)
  #   super(resource_name)
  # end

  # The path used after confirmation.
  # def after_confirmation_path_for(resource_name, resource)
  #   super(resource_name, resource)
  # end
end
