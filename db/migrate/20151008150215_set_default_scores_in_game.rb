class SetDefaultScoresInGame < ActiveRecord::Migration
  def change
    change_column :games, :score_player_a, :integer, default: 0
    change_column :games, :score_player_b, :integer, default: 0
  end
end
