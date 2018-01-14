# frozen_string_literal: true

module Pugna
  class Move
    def initialize(direction, x, y)
      @direction = direction
      @x = x
      @y = y
    end

    def self.inst(direction, x, y)
      new(direction, x, y).freeze
    end

    def self.direction(from, to)
      y = to.y - from.y
      x = to.x - from.x

      move(x, y)
    end

    def self.move(x, y)
      move = [
        y_axis(y),
        x_axis(x)
      ].reject(&:nil?)

      move.push(:STAY) if move.empty?
      move.join('_').to_sym
    end

    def self.x_axis(x)
      return :LEFT  if x.negative?
      return :RIGHT if x.positive?
      nil
    end

    def self.y_axis(y)
      return :UP   if y.negative?
      return :DOWN if y.positive?
      nil
    end
  end
end
