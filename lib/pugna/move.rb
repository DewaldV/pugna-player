# frozen_string_literal: true

module Pugna
  class Move
    def initialize(direction, x, y)
      @direction = direction
      @x = x
      @y = y
    end

    def to_sym
      @direction
    end

    def self.inst(direction, x, y)
      new(direction, x, y).freeze
    end

    def self.direction(from, to, friendlies)
      y = to.y - from.y
      x = to.x - from.x

      non_colliding(Moves[move(x, y)], friendlies)
      move = Moves[move(x, y)]

      if collides? move
        return Moves[move(0, y)] if y.abs > x.abs
        return Moves[move(x, 0)] if x.abs > y.abs
      return move
      end
    end

    def self.non_colliding(move)
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
      return :UP   if y.positive?
      return :DOWN if y.negative?
      nil
    end
  end

  Moves = {
    STAY:       Pugna::Move.inst(:STAY, 0, 0),
    LEFT:       Pugna::Move.inst(:LEFT, -1, 0),
    RIGHT:      Pugna::Move.inst(:RIGHT, 1, 0),
    UP:         Pugna::Move.inst(:UP, 0, 1),
    UP_LEFT:    Pugna::Move.inst(:UP_LEFT, -1, 1),
    UP_RIGHT:   Pugna::Move.inst(:UP_RIGHT, 1, 1),
    DOWN:       Pugna::Move.inst(:DOWN, 0, -1),
    DOWN_LEFT:  Pugna::Move.inst(:DOWN_LEFT, -1, -1),
    DOWN_RIGHT: Pugna::Move.inst(:DOWN_RIGHT, 1, -1)
  }.freeze
end
