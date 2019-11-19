class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string :link
      t.string :title
      t.string :description
      t.integer :upvote
      t.integer :downvote
      t.references :users, foreign_key: true

      t.timestamps
    end
  end
end
