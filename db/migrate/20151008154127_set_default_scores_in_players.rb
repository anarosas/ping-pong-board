class SetDefaultScoresInPlayers < ActiveRecord::Migration
  def change
    change_column :players, :global_score, :integer, default: 0
  end
end
