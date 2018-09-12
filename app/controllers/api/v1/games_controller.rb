class Api::V1::GamesController < ApplicationController
  def show
    render json: Game.first
  end
end
