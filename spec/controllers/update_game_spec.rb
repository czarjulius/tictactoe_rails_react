# frozen_string_literal: true

require "rails_helper"
require_relative "mock_game"

RSpec.describe "UpdateGame" do
  context "output" do
    it "should return a board with x in position 2" do
      current_game = Game.create(opponent: "human", current_player: "player1")
      expected_result = { board: ["-", "-", "x", "-", "-", "-", "-", "-", "-"] }
      update_game = UpdateGame.new
      expect(update_game.output(current_game, 2)).to eq(expected_result)
    end
  end
  context "update" do
    it "ensures we delegate to GameMvoe to update moves" do
      current_game = Game.create(opponent: "human", current_player: "player1")
      game = FakeGame.new

      expect(TicTacToeGame::Game).to receive(:new).and_return(game)
      expect_any_instance_of(GameMove).to receive(:all_moves).with(game, "human", "player1", 2, current_game)

      UpdateGame.new.update(current_game, 2)
    end

    it "should return toggle the player from x to player o" do
      current_game = Game.create(opponent: "human", current_player: "player1", player: "x")
      update_game = UpdateGame.new
      update_game.update(current_game, 2)
      expect(current_game.player).to eq("o")
    end

    it "should make additional move if the next player is computer" do
      current_game = Game.create(opponent: "computer", current_player: "human")
      game = FakeGame.new

      expect(TicTacToeGame::Game).to receive(:new).and_return(game)
      expect_any_instance_of(GameMove).to receive(:all_moves).exactly(2).times.and_call_original

      UpdateGame.new.update(current_game, 2)
    end

    it "should not make additional move when the game is over" do
      current_game = Game.create(opponent: "computer", current_player: "human", board: ["-", "-", "x", "-", "-", "x", "o", "-", "x"])
      game = FakeGame.new
      game.end = true

      expect(TicTacToeGame::Game).to receive(:new).and_return(game)
      expect_any_instance_of(GameMove).to receive(:all_moves).exactly(1).times
      UpdateGame.new.update(current_game, 7)
    end
  end
end
