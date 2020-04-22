require_relative 'moves_type'

class GameMove
  def all_moves(game, opponent, current_player, position, current_game)
    if opponent == 'human'
      game.move(position)
      current_game.current_player = TicTacToeGame::HumanHumanToggle.new.current_turn(current_player)
    else
      moves = MovesType.new.get_move_type(current_player)
      moves.make_move(game, position)
      current_game.current_player = TicTacToeGame::HumanComputerToggle.new.current_turn(current_player)
    end
  end
end
