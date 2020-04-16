require 'rails_helper'

RSpec.describe Game, type: :model do
  it "is valid with valid attributes" do
    expect(Game.new).to be_valid
  end
end
