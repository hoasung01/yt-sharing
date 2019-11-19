class SessionsController < ApplicationController
  def create
    if user && user.password == params[:password]
      session[:user_id] = user.id
      redirect_to root_path
    else
      user = create_user
      session[:user_id] = user.id
      redirect_to root_path
    end
  end

  private

  def user
    @user ||= User.find_by_email(params[:email])
  end

  def create_user
    user = User.new
    user.email = params[:email]
    user.password = params[:password]
    user.save
    user
  end
end
