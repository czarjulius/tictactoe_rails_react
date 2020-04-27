# frozen_string_literal: true

require 'rails_helper'
require_relative 'mock_game'

RSpec.describe 'HumanMove' do
  describe 'call the make move method' do
    it 'should invoke the move method and pass a position' do
      game = FakeGame.new
      human_move = HumanMove.new

      expect(game).to receive(:move).with(2)
      human_move.make_move(game, 2)
    end
  end
end
