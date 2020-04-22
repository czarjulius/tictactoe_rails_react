# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'DrawGame' do
  describe 'call the  gameover method' do
    it 'should return the game ended in a tie' do
      game = DrawGame.new
      expected_result = 'The game ended in a tie' 
      expect(game.game_over).to eq(expected_result)
    end
  end
end
