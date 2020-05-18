# frozen_string_literal: true

require "rails_helper"
require_relative "mock_game"

RSpec.describe "GameState" do
  context "current_state" do
    it "ensures we delegate to GameoverType to set value" do
      current_game = Game.create(opponent: "computer", current_player: "human", board: Array.new(9, "-"))
      game = FakeGame.new
      expect(TicTacToeGame::Game).to receive(:new).and_return(game)
      expect_any_instance_of(GameoverType).to receive(:message).with(game, 'computer')

      GameState.new.current_state(current_game)
    end
  end
end
