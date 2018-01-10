# frozen_string_literal: true

require 'pugna/moves'
require 'sinatra/base'

module Pugna
  class Server < Sinatra::Base
    def initialize(app = nil, moves = Pugna::Moves.new)
      super(app)
      @moves = moves
    end

    configure :development do
      require 'sinatra/reloader'
      register Sinatra::Reloader
    end

    before do
      content_type 'application/json'
    end

    get '/' do
      get_links(
        [
          { name: 'ping', methods: ['GET'] },
          { name: 'nextmove', methods: ['POST'] }
        ]
      ).to_json
    end

    get '/ping' do
      'pong'.to_json
    end

    post '/nextmove' do
      move_request = JSON.parse request.body.read
      @moves.next_move(move_request).to_json
    end

    private

    def get_links(links)
      {
        links: links.map do |link|
          {
            rel: link[:name],
            url: "#{request.base_url}/#{link[:name]}",
            methods: link[:methods]
          }
        end
      }
    end
  end
end
