require 'rails_helper'

RSpec.describe Game, type: :model do
  it "is valid with valid attributes" do
    expect(Game.new).not_to be_valid
  end
end
