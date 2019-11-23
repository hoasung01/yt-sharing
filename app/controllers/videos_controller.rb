class VideosController < ApplicationController
  def index
    @videos = Video.order(created_at: :desc).page params[:page]
    fresh_when etag: @videos
  end

  def new
    authorize
    @video = Video.new
  end

  def create
    authorize
    response = CreateVideoService.new(video_params, current_user).()

    if response.errors.blank?
      flash[:success] = t('videos.created')
      redirect_to videos_path
    else
      flash[:danger] = response.errors
      @video = Video.new
      render :new
    end
  end

  private

  def video_params
    params.require(:video).permit(:link, :title, :description, :upvote, :downvote)
  end
end
