# frozen_string_literal: true

require 'pugna/board'
require 'pugna/piece'

module Pugna
  class Moves
    def self.move_to_x_y(move)
      {
        UP_LEFT:    { x: -1, y:  1 },
        UP:         { x:  0, y:  1 },
        UP_RIGHT:   { x:  1, y:  1 },
        LEFT:       { x: -1, y:  0 },
        STAY:       { x:  0, y:  0 },
        RIGHT:      { x:  1, y:  0 },
        DOWN_LEFT:  { x: -1, y: -1 },
        DOWN:       { x:  0, y: -1 },
        DOWN_RIGHT: { x:  1, y: -1 }
      }
    end

    def next_move(state)
      # Move towards closest enemy
      # Stay if enemy is exactly 2 squares away
      # Always capture if enemy is adjacent

      board = Pugna::Board.new state[:boardState]
      active_piece = Pugna::Piece.new state[:positionToMove]

      closest_enemy = board.closest_enemy active_piece
      dist_closest_enemy = active_piece.distance_from closest_enemy

      unless dist_closest_enemy == 2
        :STAY
      end

      move_to(active_piece, closest_enemy)
    end

    def move_to(piece, enemy)
      x_dir = x_axis_move(enemy.x - piece.x)
      y_dir = y_axis_move(enemy.y - piece.y)
      if x_dir == :MID && y_dir == :MID
        :STAY
      end
      "#{y_dir}_#{x_dir}".to_sym
    end

    def x_axis_move(x)
      if x.negative?
        :LEFT
      elsif x.positive?
        :RIGHT
      else
        :MID
      end
    end

    def y_axis_move(y)
      if y.negative?
        :UP
      elsif y.positive?
        :DOWN
      else
        :MID
      end
    end
  end
end
