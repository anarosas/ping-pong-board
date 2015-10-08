class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :player_a_id
      t.integer :player_b_id
      t.time :duration
      t.integer :score_player_a
      t.integer :score_player_b

      t.timestamps null: false
    end
  end
end
