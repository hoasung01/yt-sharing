class CreateUserService
  def initialize(params)
    @params = params
  end

  def call
    create_user
  end

  private

  def create_user
    user = User.new
    user.email = @params[:email]
    user.password = @params[:password]
    user.save
    user
  end
end