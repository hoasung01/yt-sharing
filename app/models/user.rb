require 'bcrypt'

class User < ApplicationRecord
  include BCrypt

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end
end
