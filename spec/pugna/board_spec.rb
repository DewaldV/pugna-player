# frozen_string_literal: true

require 'pugna/board'

RSpec.describe Pugna::Board, '#closest_enemy' do
  context 'with enemies' do
    it 'finds the closest' do
      piece = Pugna::Piece.new('test1', 2, 2)
      board = Pugna::Board.new([
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

RSpec.describe Pugna::Board, '#friendlies' do
  context 'with friendlies' do
    it 'returns all friendly pieces' do
      piece = Pugna::Piece.new('test1', 2, 2)
      board = Pugna::Board.new([
                                 piece,
                                 Pugna::Piece.new('test1', 0, 2),
                                 Pugna::Piece.new('test1', 3, 5)
                               ])

      friendlies = board.friendlies piece

      expect(friendlies.size).to eq(3)
      friendlies.each { |f| expect(f.player_name).to eq 'test1' }
    end
  end
end
