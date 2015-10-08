require 'rails_helper'

describe Game, :type => :model do
  it 'shows formated duration time' do
    player_a = create(:player)
    player_b = create(:player, :player_b)
    game = create(:game, player_a_id: player_a.id, player_b_id: player_b.id)
    expect(game.duration_format).to match(/^(?:(?:([01]?\d|2[0-3]):)?([0-5]?\d):)?([0-5]?\d)$/)
  end  


  it "saves only scores that have 2 point of difference" do
    game = build(:game, player_a_id: 1, player_b_id: 2,  duration: Time.now, score_player_a: 19, score_player_b: 21)
    expect(game).to be_valid
  end

  it "has always a winner" do
    game = build(:game, player_a_id: 1, player_b_id: 2,  duration: Time.now, score_player_a: 21, score_player_b: 21)
    expect(game).to be_invalid
  end

  it "saves only game that have 21 or more points" do
    game = build(:game, player_a_id: 1, player_b_id: 2,  duration: Time.now, score_player_a: 19, score_player_b: 18)
    expect(game).to be_invalid
  end

  it "determines the winner and loser" do
    player_a = create(:player)
    player_b = create(:player, :player_b)
    game = create(:game, player_a_id: player_a.id, player_b_id: player_b.id, duration: Time.now, score_player_a: 23, score_player_b: 21)
    
    expect(game.player_a.wins).to eq 1
    expect(game.player_b.losses).to eq 1
  end

  it "calculates the global score" do
    player_a = create(:player, wins: 0, losses: 1, global_score: 0)
    player_b = create(:player, :player_b, wins: 3, losses: 2, global_score: 30)
    game = create(:game, player_a_id: player_a.id, player_b_id: player_b.id, duration: Time.now, score_player_a: 23, score_player_b: 21)
    
    expect(game.player_a.global_score).to eq 30
    expect(game.player_b.global_score).to eq 30
  end
end
