# frozen_string_literal: true

module Pugna
  class Piece
    attr_reader :player_name, :x, :y

    def initialize(piece_hash)
      @player_name = piece_hash[:playerName]
      @x = piece_hash[:coordinate][:x]
      @y = piece_hash[:coordinate][:y]
    end

    def enemy?(piece)
      @player_name != piece.player_name
    end

    def distance_from(other_piece)
      x_diff_sq = diff_sq(@x, other_piece.x)
      y_diff_sq = diff_sq(@y, other_piece.y)
      Math.sqrt(x_diff_sq + y_diff_sq)
    end

    private

    def diff_sq(x1, x2)
      (x1 - x2).abs**2
    end
  end
end
