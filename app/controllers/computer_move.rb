# frozen_string_literal: true

class ComputerMove
  def make_move(game, _position = nil)
    game.move(game.best_move)
  end
end
