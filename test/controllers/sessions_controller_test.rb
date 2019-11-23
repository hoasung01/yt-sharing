class SessionsControllerTest < ActionController::TestCase
  should route(:post, '/sessions').to(action: 'create')
  should route(:delete, '/logout').to(action: 'destroy')
end