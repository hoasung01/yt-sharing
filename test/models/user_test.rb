require 'test_helper'

class UserTest < ActiveSupport::TestCase
  context 'associations' do
    should have_many(:videos)
  end

  context 'validations' do
    should validate_presence_of(:email)
    should validate_uniqueness_of(:email)
    should allow_value('test@example.com').for(:email)
  end
end