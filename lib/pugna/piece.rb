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
      !friendly?(piece)
    end

    def friendly?(piece)
      @player_name == piece.player_name
    end

    def neighbour?(piece)
      (-1..1).to_a.each do |x|
        (-1..1).to_a.each do |y|
          continue if x.zero? && y.zero?
          return true if (piece.x + x == @x) && (piece.y + y == @y)
        end
      end

      false
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
