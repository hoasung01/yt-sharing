require 'test_helper'

class UserTest < ActiveSupport::TestCase
  context 'associations' do
    should have_many(:videos)
  end

  context 'validations' do
    should validate_presence_of(:email)
  end
end