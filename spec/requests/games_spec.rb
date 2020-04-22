# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Games Controller', type: :request do
  context 'create game' do
    it 'creates a game' do
      headers = { 'ACCEPT' => 'application/json' }
      post '/games', params: { game: { opponent: 'computer', current_player: 'human' } }, headers: headers
      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response).to have_http_status(:created)
    end
    it 'fails to creates a game' do
      headers = { 'ACCEPT' => 'application/json' }
      post '/games', params: { game: { oppogdgdnent: 'computer' } }, headers: headers
      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response.body).to include('error')
    end
  end

  context 'play_game' do
    it 'should move to position 2 on the game board' do
      game = Game.create(opponent: 'human', current_player: 'player1', board: Array.new(9, '-'))

      expected_result = ['-', '-', 'x', '-', '-', '-', '-', '-', '-']
      patch "/games/#{game.id}", params: { position: 2 }.to_json

      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response).to have_http_status(200)

      expect(JSON.parse(response.body)).to eq(expected_result)
    end
    it 'should output player1 as the winner' do
      game = Game.create(opponent: 'human', player: 'x', current_player: 'player1', board: ['-', '-', 'x', '-', '-', 'x', 'o', '-', 'x'])

      expected_result = 'player1 won the game'
      patch "/games/#{game.id}", params: { position: 0 }.to_json

      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)['message']).to eq(expected_result)
    end
    it 'should end the game in a tie' do
      game = Game.create(opponent: 'human', player: 'o', current_player: 'player1', board: ['o', 'x', 'o', 'x', 'o', 'x', 'x', '-', 'x'])

      expected_result = 'The game ended in a tie'
      patch "/games/#{game.id}", params: { position: 7 }.to_json

      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)['message']).to eq(expected_result)
    end
    it 'should end the game in a win by computer' do
      game = Game.create(opponent: 'computer', player: 'x', current_player: 'computer', board: ['-', '-', 'x', '-', '-', 'x', 'o', '-', 'x'])

      expected_result = 'computer won the game'
      patch "/games/#{game.id}", params: { position: 7 }.to_json

      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)['message']).to eq(expected_result)
    end
    it 'should end the game in a win by human' do
      game = Game.create(opponent: 'computer', player: 'x', current_player: 'human', board: ['-', '-', 'x', '-', '-', 'x', 'o', '-', 'x'])

      expected_result = 'human won the game'
      patch "/games/#{game.id}", params: { position: 7 }.to_json

      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)['message']).to eq(expected_result)
    end
  end
end
