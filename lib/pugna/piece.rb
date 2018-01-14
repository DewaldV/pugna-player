# frozen_string_literal: true

module Pugna
  class Piece
    attr_reader :player_name, :x, :y

    def initialize(player_name, x, y)
      @player_name = player_name
      @x = x
      @y = y
    end

    def self.from_hash(piece_hash)
      Pugna::Piece.new(
        piece_hash[:playerName],
        piece_hash[:coordinate][:x],
        piece_hash[:coordinate][:y]
      )
    end

    def to_s
      "{ player: #{@player_name}, { x: #{@x}, y: #{@y} } }"
    end

    def enemy?(piece)
      @player_name != piece.player_name
    end

    def danger_close?(_piece)
      true
    end

    def distance_from(other_piece)
      x_diff_sq = diff_sq(@x, other_piece.x)
      y_diff_sq = diff_sq(@y, other_piece.y)
      Math.sqrt(x_diff_sq + y_diff_sq)
    end

    private

    def diff_sq(x1, x2)
      (x1 - x2)**2
    end
  end
end
