# frozen_string_literal: true

require 'pugna/board'
require 'pugna/logger'
require 'pugna/move'
require 'pugna/piece'

module Pugna
  module Strategy
    class HoldIfClose
      include Pugna::Logger

      def next_move(board, active_piece)
        logger.info "Active: #{active_piece}"

        closest_enemy = board.closest_enemy active_piece
        logger.info "Closest Enemy: #{closest_enemy}"

        return :STAY if closest_enemy.nil?

        enemy_dist = active_piece.distance_from(closest_enemy).floor(2)
        logger.info "Distance to enemy: #{enemy_dist}"
        friendlies = board.friendlies(active_piece)

        return :STAY if (enemy_dist.between? 2, 4) && (friendlies.size < 4)

        move = Pugna::Move.direction(active_piece, closest_enemy, friendlies)
        logger.info "Selected move: #{move}"
        move
      end
    end
  end
end
