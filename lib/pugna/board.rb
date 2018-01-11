# frozen_string_literal: true

module Pugna
  class Board
    def initialize(size, turn, pieces)
      @size = size
      @turn = turn
      @pieces = pieces
    end

    def self.from_hash(board_hash)
      Pugna::Board.new(
        board_hash[:boardSize],
        board_hash[:turn],
        board_hash[:positions].map { |p| Pugna::Piece.from_hash p }
      )
    end

    def closest_enemy(piece)
      @pieces.select { |p| p.enemy? piece }
             .min_by { |p| p.distance_from piece }
    end
  end
end
