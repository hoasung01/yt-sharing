class RenameUsersIdFromVideos < ActiveRecord::Migration[5.2]
  def change
    rename_column :videos, :users_id, :user_id
  end
end
