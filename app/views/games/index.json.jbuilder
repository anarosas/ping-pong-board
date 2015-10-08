json.array!(@games) do |game|
  json.extract! game, :id, :player_a_id, :player_b_id, :duration, :score_player_a, :score_player_b
  json.url game_url(game, format: :json)
end
