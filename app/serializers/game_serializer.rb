class GameSerializer < ActiveModel::Serializer
  attributes :id, :player_1_score, :player_2_score



  def player_1_score
    player = User.find(object.player_1_id)
    score = player.plays.map do |play|
      play.score
    end.sum
  end

  def player_2_score
    player = User.find(object.player_2_id)
    score = player.plays.map do |play|
      play.score
    end.sum
  end
end
