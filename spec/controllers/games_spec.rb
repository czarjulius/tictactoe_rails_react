# frozen_string_literal: true

require 'rails_helper'
require_relative 'mock_game_move'
require_relative 'mock_game'

RSpec.describe GamesController, type: :controller do
  describe 'GET index' do
    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq(200)
    end
  end

end
