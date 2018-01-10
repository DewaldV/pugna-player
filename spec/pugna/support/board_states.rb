# frozen_string_literal: true

require 'pugna/moves'
require 'pugna/support/board_states'

module Pugna
  module Support
    class BoardStates
      def empty
        {
          boardState: {
            positions: [],
            boardSize: 80,
            turn: 1
          },
          positionToMove: position(1, 1, 'Player2')
        }.freeze
      end

      def enemy_adjacent
        {
          boardState: {
            positions: [
              position(0, 0, 'Player1'),
              position(3, 3, 'Player2')
            ],
            boardSize: 80,
            turn: 1
          },
          positionToMove: position(3, 3, 'Player2')
        }.freeze
      end

      def position(x, y, name)
        {
          coordinate: { x: x, y: y }, playerName: name
        }
      end
    end
  end
end
