# frozen_string_literal: true


class GameoverType
  def message(game,current_player = nil)
    return game.board unless game.end?
    return 'The game ended in a tie' if game.blocked?
    "#{current_player} won the game"
  end
end
