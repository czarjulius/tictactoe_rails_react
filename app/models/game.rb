# frozen_string_literal: true

class Game < ApplicationRecord
  validates :opponent, presence: true
  validates :current_player, presence: true

  COMPUTER = 'computer'
  HUMAN = 'human'
end
