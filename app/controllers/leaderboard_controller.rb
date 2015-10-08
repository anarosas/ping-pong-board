class LeaderboardController < ApplicationController
  def index
    @players = Player.order(global_score: :desc)
  end
end
