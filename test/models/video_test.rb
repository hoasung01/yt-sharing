require 'test_helper'

class VideoTest < ActiveSupport::TestCase
  context 'associations' do
    should belong_to(:user)
  end
end