require 'test_helper'

class VideoTest < ActiveSupport::TestCase
  context 'associations' do
    should belong_to(:user)
  end

  context 'validations' do
    VALID_LINKS = [
      'https://www.youtube.com/watch?v=U7-656WLjk8',
      'https://www.youtu.be/watch?v=SnClTd3LiMs'
    ].freeze

    INVALID_LINKS = [
      'https://www.facebook.com/hoasung01',
      'https://zing.vn',
    ].freeze

    should validate_presence_of(:link)
    should validate_uniqueness_of(:link).scoped_to(:user_id)
    VALID_LINKS.each do |link|
      should allow_value(link).for(:link)
    end

    INVALID_LINKS.each do |link|
      should_not allow_value(link).for(:link)
    end
  end
end