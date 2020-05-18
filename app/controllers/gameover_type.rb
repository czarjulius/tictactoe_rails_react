# frozen_string_literal: true

class GameoverType
  def message(game, current_player = nil)
    return { board: game.board } unless game.end?
    return { board: game.board, draw: "The game ended in a tie" } if game.blocked?
    { board: game.board, win: "#{current_player} won the game" }
  end
end
