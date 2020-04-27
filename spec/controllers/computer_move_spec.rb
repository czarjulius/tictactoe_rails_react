# frozen_string_literal: true

require 'rails_helper'
require_relative 'mock_game'

RSpec.describe 'ComputerMove' do
  describe 'call the make move method' do
    it 'should invoke the move method and pass a position' do
      game = FakeGame.new
      computer_move = ComputerMove.new

      expect(game).to receive(:move).with(game.best_move)
      computer_move.make_move(game, 2)
    end
  end
end
