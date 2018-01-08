# frozen_string_literal: true

require 'sinatra/base'

module Pugna
  class Server < Sinatra::Base
    before do
      content_type 'application/json'
    end

    get '/ping' do
      'pong'.to_json
    end

    post '/nextmove' do
      JSON.parse request.body.read
      'STAY'.to_json
    end
  end
end
