class AddDefaultValuesToVideos < ActiveRecord::Migration[5.2]
  def change
    change_column :videos, :upvote, :integer, :default => 0
    change_column :videos, :downvote, :integer, :default => 0
  end
end
