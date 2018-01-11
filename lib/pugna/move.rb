# frozen_string_literal: true

module Pugna
  class Move
    def self.move_to(piece, enemy)
      x_dir = x_axis_move(enemy.x - piece.x)
      y_dir = y_axis_move(enemy.y - piece.y)
      :STAY if x_dir == :MID && y_dir == :MID
      "#{y_dir}_#{x_dir}".to_sym
    end

    def self.x_axis_move(x)
      if x.negative?
        :LEFT
      elsif x.positive?
        :RIGHT
      else
        :MID
      end
    end

    def self.y_axis_move(y)
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
