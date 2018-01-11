# frozen_string_literal: true

require 'pugna/board'

RSpec.describe Pugna::Board, '#closest_enemy' do
  context 'with enemies' do
    it 'finds the closest' do
      piece = Pugna::Piece.new('test1', 2, 2)
      board = Pugna::Board.new(20, 1,
                               [
                                 piece,
                                 Pugna::Piece.new('test2', 0, 2),
                                 Pugna::Piece.new('test2', 3, 5)
                               ])

      closest_enemy = board.closest_enemy piece

      expect(closest_enemy.x).to eq(0)
      expect(closest_enemy.y).to eq(2)
    end
  end
end
