# frozen_string_literal: true

require 'pugna/server'
require 'rack/test'

 move_request = JSON.generate({
  "boardState": {
    "positions": [
      { "coordinate": { "x": 0, "y": 0 }, "playerName": "blah1" },
      { "coordinate": { "x": 1, "y": 1 }, "playerName": "blah2" }
    ],
    "boardSize": 0,
    "turn": 0
  },
  "positionToMove": {
    "coordinate": { "x": 0, "y": 0 },
    "playerName": ""
  }
})

RSpec.describe Pugna::Server, '/ping' do
  include Rack::Test::Methods

  def app
    Pugna::Server
  end

  it 'responds pong' do
    get '/ping'
    expect(last_response).to be_ok
    expect(last_response.body).to eq('pong'.to_json)
  end
end

RSpec.describe Pugna::Server, '/nextmove' do
  include Rack::Test::Methods

  json_header = { 'CONTENT_TYPE' => 'application/json' }

  def app
    Pugna::Server
  end

  it 'responds STAY' do
    post('/nextmove', move_request, json_header)
    expect(last_response).to be_ok
    expect(last_response.body).to eq('STAY'.to_json)
  end
end
