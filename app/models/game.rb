class Game < ActiveRecord::Base
  include ActiveModel::Validations
  belongs_to :player_a, :class_name => 'Player', :foreign_key => 'player_a_id'
  belongs_to :player_b, :class_name => 'Player', :foreign_key => 'player_b_id'
  validate :verify_scores
  after_create :set_winner

  def duration_format
    duration.strftime("%H:%M:%S")
  end

  def verify_scores
    if (self.score_player_a.to_i != self.score_player_b.to_i) && (self.score_player_a.to_i >= 21 || self.score_player_b.to_i >= 21)
      score_difference = self.score_player_a.to_i - self.score_player_b.to_i
      if (score_difference < 0)
        score_difference = score_difference * -1
      end
      if (score_difference < 2)
        errors.add(:game, 'Invalid game scores')
      end
    else 
      errors.add(:game, 'Invalid game scores')
    end
  end

  def set_winner
    if score_player_a > score_player_b
      self.player_a.update_attributes(wins: self.player_a.wins+1)
      self.player_b.update_attributes(losses: self.player_b.losses+1)
      winner = self.player_a
      loser = self.player_b
    else
      self.player_b.update_attributes(wins: self.player_b.wins+1)
      self.player_a.update_attributes(losses: self.player_a.losses+1)
      winner = self.player_b
      loser = self.player_a
    end
    set_global_score_points(winner, loser)
  end

  def set_global_score_points(winner, loser)
    if winner.global_score >= loser.global_score
      winner.update_attributes(global_score: winner.global_score+10)
    else
      winner.update_attributes(global_score: winner.global_score + loser.wins * 10)
    end
  end
end
