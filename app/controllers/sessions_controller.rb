class SessionsController < ApplicationController
  def create
    if user && same_password?
      session[:user_id] = user.id
      redirect_to root_path
    else
      user = CreateUserService.new(params).()
      session[:user_id] = user.id
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def user
    @user ||= User.find_by_email(params[:email])
  end

  def same_password?
    user.password == params[:password]
  end
end
