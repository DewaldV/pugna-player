# frozen_string_literal: true

source 'https://www.rubygems.org'

ruby File.read('.ruby-version').strip.split('-').first

gem 'rack', '~> 2.1.4'
gem 'rack-timeout', '~> 0.4.2'
gem 'sinatra', '~> 2.0.0'

group :development do
  gem 'sinatra-contrib', '~> 2.0.0'
end

group :test do
  gem 'rack-test', '~> 0.8.2'
  gem 'rspec', '~> 3.7'
end

group :production do
  gem 'puma', '~> 4.3.11'
end
