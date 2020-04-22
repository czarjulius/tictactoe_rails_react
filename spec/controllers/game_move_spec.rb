# frozen_string_literal: true

require 'rails_helper'
require_relative 'mock_game'

RSpec.describe 'GameMove' do
  describe 'call the all move method' do
    it 'should invoke the move method and pass a position' do
      current_game = Game.create(opponent: 'human', current_player: 'player1', board: Array.new(9, '-'))
      game = FakeGame.new
      game_move = GameMove.new

      expect(game).to receive(:move).with(2)
      game_move.all_moves(game, 'human', 'player1', 2, current_game)
      expect(current_game.current_player).to eq('player2')
    end
    it 'should invoke the best move method' do
      current_game = Game.create(opponent: 'computer', current_player: 'computer', board: Array.new(9, '-'))
      game = FakeGame.new
      game_move = GameMove.new

      expect(game).to receive(:move).with(game.best_move)
      game_move.all_moves(game, 'computer', 'computer', 2, current_game)
      expect(current_game.current_player).to eq('human')
    end
  end
end
