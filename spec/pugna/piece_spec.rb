# frozen_string_literal: true

require 'pugna/piece'

RSpec.describe Pugna::Piece, '#distance_from' do
  context 'another piece' do
    it 'calculates distance to be 2' do
      piece = Pugna::Piece.new(playerName: 'test', coordinate: { x: 2, y: 2 })
      another_piece = Pugna::Piece.new(playerName: 'test', coordinate: { x: 0, y: 2 })

      distance = piece.distance_from another_piece

      expect(distance).to eq(2)
    end

    it 'calculates distance to be 5' do
      piece = Pugna::Piece.new(playerName: 'test', coordinate: { x: 0, y: 0 })
      another_piece = Pugna::Piece.new(playerName: 'test', coordinate: { x: 3, y: 4 })

      distance = piece.distance_from another_piece

      expect(distance).to eq(5)
    end
  end
end
