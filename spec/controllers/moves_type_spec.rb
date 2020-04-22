# frozen_string_literal: true

require 'rails_helper'
require_relative 'mock_game'

RSpec.describe 'MovesType' do
  describe 'call the get_move_type  method' do
    it 'should return human move class when current player is human' do
      moves_type = MovesType.new
      expect(moves_type.get_move_type('human')).to be_truthy
    end

    it 'should return computer move class when current player is computer' do
      moves_type = MovesType.new
      expect(moves_type.get_move_type('computer')).to be_truthy
    end
  end
end
