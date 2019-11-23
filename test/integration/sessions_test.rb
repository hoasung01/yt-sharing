class  SessionsTest < ActionDispatch::IntegrationTest
  def test_login
    user = User.find(1)
    post '/login', params: { email: user.email, password: 'password'}
    assert_equal user.id, session[:user_id]
    assert_response :redirect
  end

  def test_logout
    user = User.find(1)
    delete '/logout'
    assert_equal nil, session[:user_id]
    assert_response :redirect
  end
end