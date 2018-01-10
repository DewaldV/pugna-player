# frozen_string_literal: true

require 'pugna/board'

RSpec.describe Pugna::Board, '#closest_enemy' do
  context 'with enemies' do
    it 'finds the closest' do
      piece = Pugna::Piece.new(playerName: 'test1', coordinate: { x: 2, y: 2 })
      board = Pugna::Board.new(boardSize: 20, turn: 1, positions: [
                                 { playerName: 'test2', coordinate: { x: 0, y: 2 } },
                                 { playerName: 'test2', coordinate: { x: 3, y: 5 } }
                               ])

      closest_enemy = board.closest_enemy piece

      expect(closest_enemy.x).to eq(0)
      expect(closest_enemy.y).to eq(2)
    end
  end
end
