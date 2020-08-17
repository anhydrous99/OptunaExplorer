# frozen_string_literal: true

class Users::ConfirmationsController < Devise::ConfirmationsController

  # GET /resource/confirmation?confirmation_token=abcdef
  def show
    super
    if Rails.env.production? and resource.errors.empty?
      username = resource[:username]
      ActiveRecord::Base.connection.exec_query "GRANT CREATE, DROP, DELETE, INSERT, SELECT, UPDATE ON #{username}.* TO '#{username}'@'%';"
      ActiveRecord::Base.connection.exec_query "FLUSH PRIVILEGES;"
    end
  end
end
