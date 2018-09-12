class Api::V1::GamesController < ApplicationController
  def show
    game = Game.find(game_params[:id])
    render json: game
  end

  private
  def game_params
    params.permit(:id)
  end
end
