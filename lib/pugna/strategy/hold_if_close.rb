# frozen_string_literal: true

require 'pugna/board'
require 'pugna/piece'

module Pugna
  module Strategy
    class HoldIfClose
      def next_move(board, active_piece)
        # Move towards closest enemy
        # Stay if enemy is exactly 2 squares away
        # Always capture if enemy is adjacent
        closest_enemy = board.closest_enemy active_piece
        dist_closest_enemy = active_piece.distance_from closest_enemy

        if dist_closest_enemy == 2
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
end
