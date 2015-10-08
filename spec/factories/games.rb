FactoryGirl.define do
  factory :game do
    player_a_id 1
    player_b_id 2
    duration Time.now
    score_player_a 21
    score_player_b 19
  end

end
