# frozen_string_literal: true

require 'logger'
require 'pugna/board'
require 'pugna/move'
require 'pugna/piece'

module Pugna
  module Strategy
    class HoldIfClose
      def next_move(board, active_piece)
        # Move towards closest enemy
        # Stay if enemy is 2 squares away
        # Always capture if enemy is adjacent
        logger.info "Active: #{active_piece}"

        closest_enemy = board.closest_enemy active_piece
        logger.info "Closest Enemy: #{closest_enemy}"

        return :STAY if closest_enemy.nil?

        enemy_dist = active_piece.distance_from(closest_enemy).floor(2)
        logger.info "Distance to enemy: #{enemy_dist}"

        return :STAY if enemy_dist.between? 2, 3

        move = Pugna::Move.direction(active_piece, closest_enemy)
        logger.info "Selected move: #{move}"
        move
      end
    end
  end
end
