class SessionsController < ApplicationController
  def create
    if user && user.password == params[:password]
      session[:user_id] = user.id
      redirect_to root_path
    else
      user = CreateUserService.new(params).()
      session[:user_id] = user.id
      redirect_to root_path
    end
  end

  private

  def user
    @user ||= User.find_by_email(params[:email])
  end
end
