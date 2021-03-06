class UpdateGame
  def update(current_game, position)
    board = current_game.board
    player = current_game.player
    opponent = current_game.opponent

    toggle = TicTacToeGame::Toggle.new(player)
    @game = TicTacToeGame::Game.new(board, player, toggle)

    return false unless board[position] == "-"
    game_move = GameMove.new
    current_player_move(current_game, game_move, opponent, position, toggle)

    while !@game.end? && current_game.current_player == Game::COMPUTER
      current_player_move(current_game, game_move, opponent, position, toggle)
    end
  end

  def current_player_move(current_game, game_move, opponent, position, toggle)
    @current_player = current_game.current_player
    game_move.all_moves(@game, opponent, @current_player, position, current_game)
    current_game.player = toggle.current_turn
    current_game.board = @game.board
  end

  def output(current_game, position)
    update(current_game, position)
    game_over = GameoverType.new
    game_over.message(@game, @current_player)
  end
end
