class SessionsController < ApplicationController
  def new
  end

  def create
    # Make sure provided parameters exist
    needed_params = [:mysql_url, :username, :password, :database]
    needed_params.each do |p|
      unless params.has_key? p
        flash[:warning] = "Warning: you are missing a field, please try again."
        render 'new'
        break
      end
    end

    session[:mysql_url] = params[:mysql_url]
    session[:username] = params[:username]
    session[:password] = params[:password]
    session[:database] = params[:database]
    session[:logged_in] = true
  end

  def destroy
    reset_session
    session[:logged_in] = false
  end

  def index
    render 'new' unless session[:logged_in]
  end
end
