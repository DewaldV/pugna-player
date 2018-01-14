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

      expect(mv).to eq(:DOWN_LEFT)
    end
  end

  context 'ambushing the enemy' do
    it 'waits if the enemy is outside attack range but within 2 moves' do
      state = board_states.enemy_within_2_squares
      board = Pugna::Board.from_hash state[:boardState]
      active_piece = Pugna::Piece.from_hash state[:positionToMove]

      pugna = Pugna::Strategy::HoldIfClose.new

      mv = pugna.next_move(board, active_piece)

      expect(mv).to eq(:STAY)
    end
  end
end
