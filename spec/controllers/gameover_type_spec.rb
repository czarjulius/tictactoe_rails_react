# frozen_string_literal: true

require 'rails_helper'
require_relative 'mock_game'

RSpec.describe 'GameoverType' do
  describe 'call the message method' do
    it 'should invoke the message class with a game parameter' do
      gameover_type = GameoverType.new
      game = FakeGame.new
      expect(gameover_type.message(game)).to be_truthy
      
    end
  end
end
