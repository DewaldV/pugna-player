# frozen_string_literal: true

require 'pugna/strategy/hold_if_close'
require 'pugna/support/board_states'

board_states = Pugna::Support::BoardStates.new

RSpec.describe Pugna::Strategy::HoldIfClose, '#next_move' do
  context 'capturing the enemy' do
    it 'moves up_left' do
      state = board_states.enemy_adjacent
      board = Pugna::Board.from_hash state[:boardState]
      active_piece = Pugna::Piece.from_hash state[:positionToMove]

      pugna = Pugna::Strategy::HoldIfClose.new

      mv = pugna.next_move(board, active_piece)

      expect(mv).to eq(:UP_LEFT)
    end
  end
end
