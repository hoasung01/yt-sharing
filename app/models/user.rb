require 'bcrypt'

class User < ApplicationRecord
  include BCrypt
  EMAIL_REGEX = /\A[^@\s]+@[^@\s]+\z/
  has_many :videos
  validates :email, presence: true, format: { with: EMAIL_REGEX }

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end
end
