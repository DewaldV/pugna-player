# frozen_string_literal: true

module Pugna
  class Board
    def initialize(pieces)
      @pieces = pieces
    end

    def self.from_hash(board_hash)
      Pugna::Board.new(
        board_hash[:positions].map { |p| Pugna::Piece.from_hash p }
      )
    end

    def closest_friend(piece)
      friendlies(piece).min_by { |p| p.distance_from piece }
    end

    def closest_enemy(piece)
      @pieces.select { |p| p.enemy? piece }
             .min_by { |p| p.distance_from piece }
    end

    def friendlies(piece)
      @pieces.select { |p| p.friendly? piece }
    end
  end
end
