class SessionsController < ApplicationController
  def new
    redirect_to '/' if current_user
  end
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
