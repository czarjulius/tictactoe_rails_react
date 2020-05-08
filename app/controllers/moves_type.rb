# frozen_string_literal: true

require_relative "human_move"
require_relative "computer_move"

class MovesType
  def get_move_type(current_player)
    if current_player == "human"
      HumanMove.new
    else
      ComputerMove.new
    end
  end
end
