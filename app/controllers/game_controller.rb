class GameController < ApplicationController
  protect_from_forgery with: :null_session

  def index
  end

  def new_game
    
    @new_game = Game.new(game_params)
    @new_game.board = Array.new(9,"-")

    if@new_game.valid?
      @new_game.save() 

      render json: @new_game, status: 201
    else
      render json: @new_game.errors.details, status: 500

    end


  end

  def game_params
    params.require(:game).permit(:opponent, :current_player)
    
  end

end
