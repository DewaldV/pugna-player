# frozen_string_literal: true

module Pugna
  module Support
    class BoardStates
      def empty
        {
          boardState: board([]),
          positionToMove: position(1, 1, 'Player2')
        }.freeze
      end

      def enemy_adjacent
        {
          boardState: board(
            [
              position(2, 2, 'Player1'),
              position(3, 3, 'Player2'),
              position(3, 4, 'Player2'),
              position(2, 3, 'Player2')
            ]
          ),
          positionToMove: position(3, 3, 'Player2')
        }.freeze
      end

      def enemy_within_2_squares
        {
          boardState: board(
            [position(1, 1, 'Player1'), position(3, 3, 'Player2')]
          ),
          positionToMove: position(3, 3, 'Player2')
        }.freeze
      end

      def position(x, y, name)
        {
          coordinate: { x: x, y: y }, playerName: name
        }
      end

      def board(positions)
        {
          positions: positions,
          boardSize: 80,
          turn: 1
        }
      end
    end
  end
end
