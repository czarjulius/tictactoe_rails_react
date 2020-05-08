class UpdateGame
  def update(current_game, position)
    board = current_game.board
    player = current_game.player
    opponent = current_game.opponent
    @current_player = current_game.current_player

    toggle = TicTacToeGame::Toggle.new(player)
    @game = TicTacToeGame::Game.new(board, player, toggle)

    return false unless board[position] == "-"
    game_move = GameMove.new
    game_move.all_moves(@game, opponent, @current_player, position, current_game)
    current_game.player = toggle.current_turn
    current_game.board = @game.board

    if !@game.end? && current_game.current_player == "computer"
      @current_player = current_game.current_player
      game_move.all_moves(@game, opponent, @current_player, position, current_game)
      current_game.player = toggle.current_turn
      current_game.board = @game.board
    end
  end

  def output(current_game, position)
    update(current_game, position)
    game_over = GameoverType.new
    game_over.message(@game, @current_player)
  end

  def update_show_game(resume_game)
    player = resume_game.player
    @opponent = resume_game.opponent
    current_player = resume_game.current_player
    board = resume_game.board
    toggle = TicTacToeGame::Toggle.new(player)
    game = TicTacToeGame::Game.new(board, player, toggle)
    winner = get_toggle.current_turn(current_player)
    game_over = GameoverType.new
    game_over.message(game, winner)
  end

  def get_toggle
    if @opponent == "human"
      return TicTacToeGame::HumanHumanToggle.new
    end
    return TicTacToeGame::HumanComputerToggle.new
  end
end
