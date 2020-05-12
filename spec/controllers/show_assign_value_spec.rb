# frozen_string_literal: true

require "rails_helper"
require_relative "mock_game"

RSpec.describe "ShowAssignValue" do
  context "update" do
    it "ensures we delegate to GameoverType to set value" do
      current_game = Game.create(opponent: "human", current_player: "player1", board: Array.new(9, "-"))
      game = FakeGame.new
      winner = "human"
      expect(TicTacToeGame::Game).to receive(:new).and_return(game)
      expect_any_instance_of(GameoverType).to receive(:message).with(game, winner)

      ShowAssignValue.new.set_value(current_game)
    end

    xit "should return toggle the player from x to player o" do
      current_game = Game.create(opponent: "human", current_player: "player1", player: "x", board: Array.new(9, "-"))
      show_assign_value = ShowAssignValue.new
      show_assign_value.set_value(current_game)
      expect(current_game.current_player).to eq("player2")
    end

    xit "should make additional move if the next player is computer" do
      current_game = Game.create(opponent: "computer", current_player: "computer", board: Array.new(9, "-"))
      game = FakeGame.new

      expect(TicTacToeGame::Game).to receive(:new).and_return(game)
      expect_any_instance_of(GameMove).to receive(:all_moves).exactly(2).times

      UpdateGame.new.update(current_game, 2)
    end

    xit "should not make additional move when the game is over" do
      current_game = Game.create(opponent: "computer", current_player: "human", board: ["-", "-", "x", "-", "-", "x", "o", "-", "x"])
      game = FakeGame.new
      game.end = true

      expect(TicTacToeGame::Game).to receive(:new).and_return(game)
      expect_any_instance_of(GameMove).to receive(:all_moves).exactly(1).times
      UpdateGame.new.update(current_game, 7)
    end
  end
end
