# frozen_string_literal: true

require 'rails_helper'
require_relative 'mock_game'

RSpec.describe 'UpdateGame' do
    context'output' do
        it'should return a board with x in position 2' do
            current_game = Game.create(opponent: 'human', current_player: 'player1', board: Array.new(9, '-'))
            expected_result = {board:['-', '-', 'x', '-', '-', '-', '-', '-', '-']}
            update_game = UpdateGame.new
            expect(update_game.output(current_game, 2)).to eq(expected_result)
        end
    end
    context'update' do
        it'ensures we delegate to GameMvoe to update moves' do
            current_game = Game.create(opponent: 'human', current_player: 'player1', board: Array.new(9, '-'))
            game = FakeGame.new

            expect(TicTacToeGame::Game).to receive(:new).and_return(game)
            expect_any_instance_of(GameMove).to receive(:all_moves).with(game, 'human', 'player1', 2, current_game)

            UpdateGame.new.update(current_game, 2)
        end

        it'should return toggle the player from x to player o' do
            current_game = Game.create(opponent: 'human', current_player: 'player1', player: 'x', board: Array.new(9, '-'))
            update_game = UpdateGame.new
            update_game.update(current_game, 2)
            expect(current_game.player).to eq('o')
        end
    end
end
