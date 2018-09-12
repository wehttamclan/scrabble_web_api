class GameSerializer < ActiveModel::Serializer
  attributes :id, :scores

  def scores
    [player_1_score, player_2_score]
  end

  def player_1_score
    player = User.find(object.player_1_id)
    score = player.plays.map do |play|
      play.score
    end.sum
    {user_id: player.id, score: score}
  end

  def player_2_score
    player = User.find(object.player_2_id)
    score = player.plays.map do |play|
      play.score
    end.sum
    {user_id: player.id, score: score}
  end
end
