# frozen_string_literal: true

workers Integer(ENV['WEB_CONCURRENCY'] || 2)
preload_app!

port        ENV['PORT']     || 4567
environment ENV['RACK_ENV'] || 'development'
