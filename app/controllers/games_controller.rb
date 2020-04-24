# frozen_string_literal: true

class GamesController < ApplicationController
  protect_from_forgery with: :null_session

  def index; end

  def create
    @new_game = Game.new(game_params)
    @new_game.board = Array.new(9, '-')

    if @new_game.valid?
      @new_game.save

      render json: @new_game, status: 201
    else
      render json: @new_game.errors.details, status: 500

    end
  end

  def play_game
    current_game = Game.find(params[:id])
    position = params[:position].to_i

    game_output = UpdateGame.new.output(current_game, position)

    render json: { message: game_output }, status: 200

    current_game.save
  end

  private

  def game_params
    params.require(:game).permit(:opponent, :current_player)
  end
end
