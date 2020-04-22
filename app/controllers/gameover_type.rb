require_relative 'win_game'
require_relative 'draw_game'

class GameoverType
    def message(game)
      if game.blocked?
        DrawGame.new
      else
         WinGame.new
      end
    end
end