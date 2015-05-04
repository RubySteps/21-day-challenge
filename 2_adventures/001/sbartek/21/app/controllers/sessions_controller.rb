class SessionsController < ApplicationController

  def create
    session[:user_name] = auth_hash["info"]["name"]
    redirect_to root_path
  end

  def destroy
    session[:user_name] = nil
    redirect_to root_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

end
