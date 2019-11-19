class VideosController < ApplicationController
  before_action :authorize

  def index
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params.merge(user_id: current_user.id))

    if @video.save
      redirect_to videos_path
    else
      render :new
    end
  end

  private

  def video_params
    params.require(:video).permit(:link)
  end
end
