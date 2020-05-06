# frozen_string_literal: true

require 'rails_helper'
require_relative 'mock_game'

RSpec.describe 'GameoverType' do
  describe 'call the message method' do
    it 'should diplay that the game ends in a tie' do
      game = FakeGame.new
      game.end = true
      game.is_blocked = true
      gameover_type = GameoverType.new
      expected_result = {board: ["-", "-", "-", "-", "-", "-", "-", "-", "-"], draw:'The game ended in a tie'}
      expect(gameover_type.message(game)).to eq(expected_result)
    end
    it 'should diplay that player1 won the game' do
      game = FakeGame.new
      game.end = true
      gameover_type = GameoverType.new
      expected_result = {board: ["-", "-", "-", "-", "-", "-", "-", "-", "-"],win:'player1 won the game'}
      expect(gameover_type.message(game, 'player1')).to eq(expected_result)
    end
  end
end
