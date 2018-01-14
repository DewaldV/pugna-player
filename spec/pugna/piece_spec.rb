# frozen_string_literal: true

require 'pugna/piece'

RSpec.describe Pugna::Piece, '#distance_from' do
  context 'another piece' do
    it 'calculates distance to be 2' do
      piece = Pugna::Piece.new('test', 2, 2)
      another_piece = Pugna::Piece.new('test', 0, 2)

      distance = piece.distance_from another_piece

      expect(distance).to eq(2)
    end

    it 'calculates distance to be 5' do
      piece = Pugna::Piece.new('test', 0, 0)
      another_piece = Pugna::Piece.new('test', 3, 4)

      distance = piece.distance_from another_piece

      expect(distance).to eq(5)
    end
  end
end

RSpec.describe Pugna::Piece, '#to_s' do
  context 'for a piece' do
    it 'converts the piece to string' do
      piece = Pugna::Piece.new('test', 2, 3)

      expect(piece.to_s).to eq('{ player: test, { x: 2, y: 3 } }')
    end
  end
end

RSpec.describe Pugna::Piece, '#danger_close?' do
  context 'an enemy piece' do
    it 'knows if enemies are within 2 moves' do
      piece = Pugna::Piece.new('test', 2, 2)
      another_piece = Pugna::Piece.new('test', 0, 2)

      danger = piece.danger_close? another_piece

      expect(danger).to be true
    end
  end
end
