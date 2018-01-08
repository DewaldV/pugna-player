#!/usr/bin/env ruby
# frozen_string_literal: true

$LOAD_PATH << File.expand_path('lib/')

require 'rubygems'
require 'bundler/setup'
require 'pugna/server'

Pugna::Server.run!
