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

    MOVES = {
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

    def self.direction(piece, enemy)
      move = [
        y_axis(enemy.y - piece.y),
        x_axis(enemy.x - piece.x)
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
