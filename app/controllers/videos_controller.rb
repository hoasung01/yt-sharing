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
    @video = Video.new(video_params.merge(user_id: current_user.id))
    fetch_additional_info(@video)

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

  def fetch_additional_info(video)
    video_decorator = VideoDecorator.new(video)
    response = YoutubeService.new(video_decorator.youtube_id).()

    unless reponse.empty?
      video_params.merge!(
        title: response['items'][0]['snippet']['title'],
        description: response['items'][0]['snippet']['description'],
        upvote: response['items'][0]['statistics']['likeCount'],
        downvote:  response['items'][0]['statistics']['dislikeCount']
      )
    end
  end
end
