# frozen_string_literal: true

module Pugna
  class Board
    def initialize(board_hash)
      @size = board_hash[:boardSize]
      @turn = board_hash[:turn]
      @pieces = board_hash[:positions].map { |p| Pugna::Piece.new p }
    end

    def closest_enemy(piece)
      @pieces.select { |p| p.enemy? piece }
             .min_by { |p| p.distance_from piece }
    end
  end
end
