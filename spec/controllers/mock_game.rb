# frozen_string_literal: true

class FakeGame
  attr_accessor :is_blocked
  attr_reader :board
  attr_accessor :end

  def initialize(board=Array.new(9, '-'),is_blocked = false)
    @is_blocked = is_blocked
    @board = board
    @end = false

  end

  def move(position); end

  def best_move; end

  def blocked?
    @is_blocked
  end
  def end?
    @end
  end
end
