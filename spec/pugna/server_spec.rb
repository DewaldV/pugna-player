# frozen_string_literal: true

require 'json'
require 'pugna/server'
require 'pugna/support/board_states'
require 'rack/test'

board_states = Pugna::Support::BoardStates.new
move_request = board_states.enemy_adjacent.to_json

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

  it 'responds UP_LEFT' do
    post('/nextmove', move_request, json_content)
    expect(last_response).to be_ok
    expect(last_response.body).to eq(:UP_LEFT.to_json)
  end
end
