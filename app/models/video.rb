class Video < ApplicationRecord
  paginates_per 5
  belongs_to :user
  validates :link, presence: true
end
