# frozen_string_literal: true

require 'json'
require 'pugna/server'
require 'rack/test'

 move_request = {
  boardState: {
    positions: [
      { coordinate: { x: 0, y: 0 }, playerName: 'blah1' },
      { coordinate: { x: 1, y: 1 }, playerName: 'blah2' }
    ],
    boardSize: 0,
    turn: 0
  },
  positionToMove: {
    coordinate: { x: 0, y: 0 },
    playerName: ''
  }
}.to_json

move_response = 'STAY'.to_json

link_response = {
  links: [
    { rel: 'ping', url: 'http://example.org/ping', methods: ['GET'] },
    { rel: 'nextmove', url: 'http://example.org/nextmove', methods: ['POST'] }
  ]
}

RSpec.describe Pugna::Server, 'GET /' do
  include Rack::Test::Methods

  def app
    Pugna::Server
  end

  it 'responds with links' do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to eq(link_response.to_json)
  end
end

RSpec.describe Pugna::Server, 'GET /ping' do
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

RSpec.describe Pugna::Server, 'POST /nextmove' do
  include Rack::Test::Methods

  json_content = { 'CONTENT_TYPE' => 'application/json' }

  def app
    Pugna::Server
  end

  it 'responds STAY' do
    post('/nextmove', move_request, json_content)
    expect(last_response).to be_ok
    expect(last_response.body).to eq(move_response)
  end
end
