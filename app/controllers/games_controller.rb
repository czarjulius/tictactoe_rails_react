class GamesController < ApplicationController
  protect_from_forgery with: :null_session

  def index
  end

  def create
    
    @new_game = Game.new(game_params)
    @new_game.board = Array.new(9,"-")

    if@new_game.valid?
      @new_game.save() 

      render json: @new_game, status: 201
    else
      render json: @new_game.errors.details, status: 500

    end
  end


  def update
    current_game = Game.find(params[:id])
    payload = JSON.parse(request.body.read)
    position = payload['position'].to_i

    board = current_game.board
    player = current_game.player
    toggle = TicTacToeGame::Toggle.new(player)

    game = TicTacToeGame::Game.new(board,player, toggle)

    game.move(position)
    current_game.player = toggle.current_turn
    current_game.board = game.board
    current_player = current_game.current_player

    if game.end?
      if game.blocked?
          return render json: {message: "The game ended in a tie"}, status: 200
      else
        return render json: {message: "#{current_player} won the game"}, status: 200
      end
    end

    current_game.current_player =  TicTacToeGame::HumanHumanToggle.new.current_turn(current_player)

    current_game.save()

    render json: game.board, status: 200
  end

  private
  def game_params
    params.require(:game).permit(:opponent, :current_player)
    
  end

end
