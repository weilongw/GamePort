class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :comment
      t.integer :user_id
      t.integer :game_id

      t.timestamps
    end
  end
end
