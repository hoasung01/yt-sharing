require 'test_helper'

class VideoTest < ActiveSupport::TestCase
  context 'associations' do
    should belong_to(:user)
  end

  context 'validations' do
    should validate_presence_of(:link)
    should validate_uniqueness_of(:link).scoped_to(:user_id)
    should allow_value('https://www.youtube.com/watch?v=U7-656WLjk8').for(:link)
  end
end