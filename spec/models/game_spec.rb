require 'rails_helper'

RSpec.describe Game, type: :model do
  it "is valid when all attributes are provided" do
    game = Game.new(opponent: 'human', current_player: 'player1')

    expect(game).to be_valid
  end

  it "is invalid when opponent attributes is missing" do
    game = Game.new(opponent: nil, current_player: 'player1')

    expect(game).not_to be_valid
  end
  it "is invalid when current_player attributes is missing" do
    game = Game.new(opponent: 'human', current_player: nil)

    expect(game).not_to be_valid
  end
end
