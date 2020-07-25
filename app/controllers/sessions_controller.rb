class SessionsController < ApplicationController
  def new
  end

  def create
    flash[:warning] = 'Error'
    render 'new'
  end
end
