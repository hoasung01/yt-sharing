require 'test_helper'

class VideoTest < ActiveSupport::TestCase
  context 'associations' do
    should belong_to(:user)
  end

  context 'validations' do
    should validate_presence_of(:link)
    should validate_uniqueness_of(:link).scoped_to(:user_id)
  end
end