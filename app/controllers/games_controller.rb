# frozen_string_literal: true

class GamesController < ApplicationController
  def index; end

  def create
    @new_game = Game.new(game_params)

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

  def show
    resume_game = Game.find_by(:id => params[:id])
    if resume_game.present?
      game_status = GameState.new.current_state(resume_game)
      render json: { data: { message: game_status, id: resume_game.id } }, status: 200
    else
      render json: { message: "Game with Id: " + params[:id] + " is not found" }, status: 404
    end
  end

  private

  def game_params
    params.require(:game).permit(:opponent, :current_player)
  end
end
