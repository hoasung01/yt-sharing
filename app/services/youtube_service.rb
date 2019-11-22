require 'rest-client'

class YoutubeService
  BASE_URL = 'https://www.googleapis.com/youtube/v3/videos'

  def initialize(youtube_id)
    @youtube_id = youtube_id
  end

  def call
    response = RestClient.get(BASE_URL,
      {
        params: {
          id: @youtube_id,
          key: 'AIzaSyCtlil64yYmfc00gXGOUuDoAg2lVQ6E24c', #ENV[:YOUTUBE_API_KEY]
          part: 'statistics, snippet'
        }
      }
    )
    JSON.parse(response).with_indifferent_access
  rescue RestClient::ExceptionWithResponse => e
    Rails.logger.error "Can not get Youtube Information @#{@youtube_id}: #{e.message}"
    {}
  end
end