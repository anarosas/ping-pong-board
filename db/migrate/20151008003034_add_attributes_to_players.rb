class AddAttributesToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :wins, :integer
    add_column :players, :losses, :integer
    add_column :players, :total_games, :integer
    add_column :players, :global_score, :integer
  end
end
