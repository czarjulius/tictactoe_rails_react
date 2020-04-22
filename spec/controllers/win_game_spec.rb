# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'WinGame' do
  describe 'call the  gameover method' do
    it 'should return player1 as the winner' do
      game = WinGame.new
      expected_result = "player1 won the game" 
      expect(game.game_over('player1')).to eq(expected_result)
    end
  end
end
