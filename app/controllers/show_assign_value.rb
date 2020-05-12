class ShowAssignValue
  def set_value(resume_game)
    player = resume_game.player
    opponent = resume_game.opponent
    current_player = resume_game.current_player
    board = resume_game.board
    toggle = TicTacToeGame::Toggle.new(player)
    game = TicTacToeGame::Game.new(board, player, toggle)
    winner = get_toggle(opponent).current_turn(current_player)
    game_over = GameoverType.new
    game_over.message(game, winner)
  end

  def get_toggle(opponent)
    if opponent == Game::HUMAN
      TicTacToeGame::HumanHumanToggle.new
    end
    TicTacToeGame::HumanComputerToggle.new
  end
end
