class HomeController < ApplicationController
  before_action :ensure_subdomain, :set_user

  def index
  end

  private

  def set_user
    @logged_in = user_signed_in?
    if @logged_in
      @user = current_user
    end
  end
end
