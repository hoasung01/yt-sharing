require 'test_helper'

class UserTest < ActiveSupport::TestCase
  context 'associations' do
    should have_many(:videos)
  end

  context 'validations' do
    VALID_EMAILS = [
      'test@example.com',
      'nguyenngochai.shipagent@gmail.com'
    ].freeze

    INVALID_EMAILS = [
      'test1231.com',
      'nguyenngochai.shipagent'
    ].freeze

    should validate_presence_of(:email)
    should validate_uniqueness_of(:email)
    VALID_EMAILS.each do |link|
      should allow_value(link).for(:email)
    end

    INVALID_EMAILS.each do |link|
      should_not allow_value(link).for(:email)
    end
  end
end