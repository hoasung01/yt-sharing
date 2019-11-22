class VideosController < ApplicationController
  def index
    @videos = Video.order(created_at: :desc).page params[:page]
  end

  def new
    authorize
    @video = Video.new
  end

  def create
    authorize
    response = CreateVideoService.new(video_params, current_user).()

    if response.errors.blank?
      redirect_to videos_path
    else
      render :new
    end
  end

  private

  def video_params
    params.require(:video).permit(:link, :title, :description, :upvote, :downvote)
  end
end
