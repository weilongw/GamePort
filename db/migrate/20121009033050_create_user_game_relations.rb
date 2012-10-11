class CreateUserGameRelations < ActiveRecord::Migration
  def change
    create_table :user_game_relations do |t|
      t.integer :user_id
      t.integer :game_id

      t.timestamps
    end
    add_index :user_game_relations, :user_id
    add_index :user_game_relations, :game_id
    add_index :user_game_relations, [:user_id, :game_id], unique: true
  end
end
