class ComputerMove
    def make_move(game, position=nil)
      game.move(game.best_move)
    end
end