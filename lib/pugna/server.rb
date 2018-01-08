# frozen_string_literal: true

require 'json'
require 'sinatra'

before do
  content_type 'application/json'
end

get '/ping' do
  'pong'.to_json
end

post '/nextmove' do
  puts request
  puts request.body
  puts request.body.read
  request.body.rewind
  JSON.parse request.body.read
  JSON.generate 'STAY'
end
