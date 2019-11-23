class VideosTest < ActionDispatch::IntegrationTest
  def test_create_video
    user = User.find(1)
    post '/login', params: { email: user.email, password: 'password'}

    post '/videos', params: {
      video: {
        link: 'https://www.youtube.com/watch?v=drj8kLgXOGU',
        user_id: user.id
      }
    }

    assert_response :redirect
  end
end