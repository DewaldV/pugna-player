# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'

module Pugna
  class Server < Sinatra::Base
    configure :development do
      register Sinatra::Reloader
    end

    before do
      content_type 'application/json'
    end

    get '/' do
      get_links(
        [
          { name: 'ping', methods: ['GET'] },
          { name: 'nextmove', methods: ['POST']}
        ]
      ).to_json
    end

    get '/ping' do
      'pong'.to_json
    end

    post '/nextmove' do
      JSON.parse request.body.read
      'STAY'.to_json
    end

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
