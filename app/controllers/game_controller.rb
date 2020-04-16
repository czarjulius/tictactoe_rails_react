class GameController < ApplicationController
  protect_from_forgery with: :null_session

  def index
  end

  def opponent
    
    @opponent = Game.new(opponent: params[:opponent])
    @opponent.board = Array.new(9,"-")

    @opponent.save() 

    render json: {data: @opponent}, status: 201
  end

end
