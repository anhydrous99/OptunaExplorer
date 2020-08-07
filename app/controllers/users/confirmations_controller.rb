# frozen_string_literal: true

class Users::ConfirmationsController < Devise::ConfirmationsController

  # GET /resource/confirmation?confirmation_token=abcdef
  def show
    super
    if Rails.env.production? and resource.errors.empty?
      username = resource[:username]
      ActiveRecord::Base.connection.exec_query "GRANT DELETE, INSERT, SELECT, UPDATE ON #{username}.* TO '#{username}'@'%';"
      ActiveRecord::Base.connection.exec_query "ALTER USER '#{username}'@'%' WITH MAX_QUERIES_PER_HOUR 240;"
      ActiveRecord::Base.connection.exec_query "FLUSH PRIVILEGES;"
    end
  end
end
