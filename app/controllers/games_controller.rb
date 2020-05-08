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

  def show
    resume_game = Game.where(:id => params[:id]).first
    if !resume_game.nil?
      player = resume_game.player
      # @opponent = resume_game.opponent
      current_player = resume_game.current_player
      board = resume_game.board
      toggle = TicTacToeGame::Toggle.new(player)
      game = TicTacToeGame::Game.new(board, player, toggle)
      # winner =  get_toggle.current_turn(current_player)
      game_over = GameoverType.new
      answer = game_over.message(game, current_player)
      render json: { data:{message: answer,id: resume_game.id} }, status: 200
    else
      render json: { message: "Game with Id: " + params[:id]+ " is not found" }, status: 404
    end
  end



  private

  def game_params
    params.require(:game).permit(:opponent, :current_player)
  end

  # def get_toggle
  #   if @opponent == "human"
  #    return TicTacToeGame::HumanHumanToggle.new
  #   end
  #    return TicTacToeGame::HumanComputerToggle.new
  # end
end
