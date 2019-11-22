class CreateUserService
  attr_reader :errors, :user

  def initialize(params)
    @params = params
  end

  def call
    create_user
    self
  end

  private

  def create_user
    user = User.new.tap do |u|
      u.email = @params[:email]
      u.password = @params[:password]
    end

    if user.save
      @user = user
    else
      @errors = user.errors.full_messages.to_sentence
    end
  end
end