class VideoDecorator < SimpleDelegator
  DEFAULT_ID = 'cuaKvwVmPaA'.freeze

  def model
    __getobj__
  end

  def shared_by
    user.email
  end

  def youtube_id
    match_regex = model.link.match(/\?v=([\D\d]*)/)
    match_regex ? match_regex[1]: DEFAULT_ID
  end

  private

  def user
    @user ||= User.find_by_id(model.user_id)
  end
end