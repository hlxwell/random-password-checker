# encoding: utf-8
require "rubygems"

# Set up gems listed in the Gemfile.
require 'bundler'
Bundler.setup
Bundler.require(:default)

lib = File.expand_path("../../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?('lib') || $LOAD_PATH.include?(lib)
$LOAD_PATH.unshift File.dirname(__FILE__)

require "rspec"
require "rspec/autorun"

begin
  require 'ruby-debug'
rescue LoadError => e
  puts "debugger disabled"
end

RSpec.configure do |config|
  config.mock_with :rspec
end

require 'random_password'