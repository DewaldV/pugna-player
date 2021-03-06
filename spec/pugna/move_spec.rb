# frozen_string_literal: true

require 'pugna/move'

# rubocop:disable Metrics/BlockLength
RSpec.describe Pugna::Move, '#direction' do
  context 'between two pieces' do
    it 'finds the direction to move is up_right' do
      piece1 = Pugna::Piece.new('test1', 2, 2)
      piece2 = Pugna::Piece.new('test2', 3, 3)

      direction = Pugna::Move.direction(piece1, piece2)

      expect(direction).to eq(:UP_RIGHT)
    end

    it 'finds the direction to move is stay' do
      piece1 = Pugna::Piece.new('test1', 2, 2)
      piece2 = Pugna::Piece.new('test2', 2, 2)

      direction = Pugna::Move.direction(piece1, piece2)

      expect(direction).to eq(:STAY)
    end

    it 'finds the direction to move is right' do
      piece1 = Pugna::Piece.new('test1', 2, 2)
      piece2 = Pugna::Piece.new('test2', 3, 2)

      direction = Pugna::Move.direction(piece1, piece2)

      expect(direction).to eq(:RIGHT)
    end

    it 'finds the direction to move is down' do
      piece1 = Pugna::Piece.new('test1', 2, 2)
      piece2 = Pugna::Piece.new('test2', 2, 1)

      direction = Pugna::Move.direction(piece1, piece2)

      expect(direction).to eq(:DOWN)
    end

    it 'finds the direction to move is up' do
      piece1 = Pugna::Piece.new('test1', 2, 1)
      piece2 = Pugna::Piece.new('test2', 2, 2)

      direction = Pugna::Move.direction(piece1, piece2)

      expect(direction).to eq(:UP)
    end
  end
end
