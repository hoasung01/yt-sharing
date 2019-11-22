class SessionsController < ApplicationController
  def create
    if user && same_password?
      flash[:success] = t('sessions.signed_in')
      session[:user_id] = user.id
    else
      response = CreateUserService.new(params).()

      if response.errors.blank?
        flash[:success] = t('sessions.signed_in')
        session[:user_id] = response.user.id
      else
        flash[:danger] = response.errors
      end
    end
    redirect_to root_path
  end

  def destroy
    flash[:info] = t('sessions.signed_out')
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
