class Video < ApplicationRecord
  belongs_to :user
  validates :link, presence: true
end
