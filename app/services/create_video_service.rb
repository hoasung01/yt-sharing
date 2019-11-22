class CreateVideoService
  attr_reader :errors, :video

  def initialize(video_params, current_user)
    @video_params = video_params
    @current_user = current_user
  end

  def call
    create_video
    self
  end

  private

  def create_video
    video = Video.new.tap do |vid|
      vid.link = @video_params[:link]
      vid.user_id = @current_user.id
      response = fetch_additional_info(vid)

      unless response.empty?
        vid.title = response['items'][0]['snippet']['title']
        vid.description = response['items'][0]['snippet']['description']
        vid.upvote = response['items'][0]['statistics']['likeCount']
        vid.downvote = response['items'][0]['statistics']['dislikeCount']
      end
    end

    if video.save
      @video = video
    else
      @errors = video.errors.full_messages.to_sentence
    end
  end

   def fetch_additional_info(video)
    video_decorator = VideoDecorator.new(video)
    response = YoutubeService.new(video_decorator.youtube_id).()
  end
end
