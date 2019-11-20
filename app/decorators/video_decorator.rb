class VideoDecorator < SimpleDelegator
  def model
    __getobj__
  end

  def shared_by
    user.email
  end

  private

  def user
    @user ||= User.find_by_id(model.user_id)
  end
end