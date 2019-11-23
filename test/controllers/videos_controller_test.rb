class VideosControllerTest < ActionController::TestCase
  should route(:get, '/videos').to(action: 'index')
  should route(:post, '/videos').to(action: 'create')
  should route(:get, '/share').to(action: 'new')
end