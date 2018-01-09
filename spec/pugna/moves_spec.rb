# frozen_string_literal: true

require 'json'
require 'pugna/moves'

RSpec.describe Pugna::Moves, '#move' do
  context 'when nothing on the board' do
    it 'stays' do
      pugna = Pugna::Moves.new

      mv = pugna.move({})

      expect(mv).to be(:STAY)
    end
  end
end
