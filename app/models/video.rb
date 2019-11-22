class Video < ApplicationRecord
  paginates_per 5
  belongs_to :user
  validates_presence_of :link
  validates_format_of :link, with: /\A^(http(s)?:\/\/)?((w){3}.)?youtu(be|.be)?(\.com)?\/.+\Z/i
end