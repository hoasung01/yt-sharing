class Video < ApplicationRecord
  LINK_REGEX = /\A^(http(s)?:\/\/)?((w){3}.)?youtu(be|.be)?(\.com)?\/.+\Z/i
  paginates_per 5
  belongs_to :user
  validates :link, presence: true, format: { with: LINK_REGEX }
end