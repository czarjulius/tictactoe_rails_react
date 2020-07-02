# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Games Controller", type: :request do
  context "create game" do
    it "creates a game" do
      headers = { "ACCEPT" => "application/json" }
      post "/games", params: { game: { opponent: "computer", current_player: "human" } }, headers: headers
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(:created)
    end
    it "fails to creates a game" do
      headers = { "ACCEPT" => "application/json" }
      post "/games", params: { game: { oppogdgdnent: "computer" } }, headers: headers
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response.body).to include("error")
    end
  end

  let(:json) { JSON.parse(response.body) }

  context "play_game ..." do
    it "should move to position 2 on the game board" do
      game = Game.create(opponent: "human", current_player: "player1", board: Array.new(9, "-"))

      expected_result = { "message" => { "board" => ["-", "-", "x", "-", "-", "-", "-", "-", "-"] } }
      patch "/games/#{game.id}/move/2"

      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(200)

      expect(json).to eq(expected_result)
    end
    it "should output player1 as the winner" do
      game = Game.create(opponent: "human", player: "x", current_player: "player1", board: ["-", "-", "x", "-", "-", "x", "o", "-", "x"])

      expected_result = { "board" => ["x", "-", "x", "-", "-", "x", "o", "-", "x"], "win" => "player1 won the game" }
      patch "/games/#{game.id}/move/0"

      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(200)
      expect(json["message"]).to eq(expected_result)
    end
    it "should end the game in a tie" do
      game = Game.create(opponent: "human", player: "o", current_player: "player1", board: ["o", "x", "o", "x", "o", "x", "x", "-", "x"])

      expected_result = { "board" => ["o", "x", "o", "x", "o", "x", "x", "o", "x"], "draw" => "The game ended in a tie" }
      patch "/games/#{game.id}/move/7"

      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(200)
      expect(json["message"]).to eq(expected_result)
    end
    it "should end the game in a win by computer" do
      game = Game.create(opponent: "computer", player: "x", current_player: "computer", board: ["-", "-", "x", "-", "-", "x", "o", "-", "x"])

      expected_result = { "board" => ["x", "-", "x", "-", "-", "x", "o", "-", "x"], "win" => "computer won the game" }
      patch "/games/#{game.id}/move/7"

      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(200)
      expect(json["message"]).to eq(expected_result)
    end
    it "should end the game in a win by human" do
      game = Game.create(opponent: "computer", player: "x", current_player: "human", board: ["-", "-", "x", "-", "-", "x", "o", "-", "x"])

      expected_result = { "board" => ["-", "-", "x", "-", "-", "x", "o", "x", "x"], "win" => "human won the game" }
      patch "/games/#{game.id}/move/7"

      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(200)
      expect(json["message"]).to eq(expected_result)
    end
    it "should  fail to end the game in a win by human" do
      game = Game.create(opponent: "computer", player: "o", current_player: "human", board: [
                           "o", "-", "x",
                           "-", "-", "x",
                           "-", "-", "-",
                         ])

      expected_result = { "board" => ["o", "o", "x", "-", "-", "x", "-", "-", "x"], "win" => "computer won the game" }
      patch "/games/#{game.id}/move/1"

      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(200)
      expect(json["message"]).to eq(expected_result)
    end

    it "should return a game when a valid game id is provided" do
      game = Game.create(opponent: "computer", player: "x", current_player: "human", board: ["-", "-", "x", "-", "-", "x", "o", "-", "x"])

      expected_result = { "board" => ["-", "-", "x", "-", "-", "x", "o", "-", "x"], "win" => "computer won the game" }
      get "/games/#{game.id}"

      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(200)
      expect(json["data"]["message"]).to eq(expected_result)
    end
    it "should fail to return a game when an inalid game id is provided" do
      Game.create(opponent: "computer", player: "x", current_player: "human", board: ["-", "-", "x", "-", "-", "x", "o", "-", "x"])
      get "/games/98765"

      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(404)
    end
  end
end
