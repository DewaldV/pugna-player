# frozen_string_literal: true

require 'pugna/strategy/hold_if_close'
require 'pugna/support/board_states'

board_states = Pugna::Support::BoardStates.new

RSpec.describe Pugna::Strategy::HoldIfClose, '#next_move' do
  context 'capturing the enemy' do
    it 'moves up_left' do
      board = board_states.enemy_adjacent
      pugna = Pugna::Strategy::HoldIfClose.new

      mv = pugna.next_move(board)

      expect(mv).to eq(:UP_LEFT)
    end
  end
end
