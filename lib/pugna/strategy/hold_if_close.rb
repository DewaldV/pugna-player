# frozen_string_literal: true

require 'pugna/board'
require 'pugna/move'
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

        return :STAY if dist_closest_enemy == 2

        Pugna::Move.direction(active_piece, closest_enemy)
      end
    end
  end
end
