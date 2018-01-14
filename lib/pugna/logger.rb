# frozen_string_literal: true

require 'logger'

module Pugna
  module Logger
    def logger
      @logger ||= ::Logger.new(STDOUT)
    end
  end
end
