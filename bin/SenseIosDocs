#!/usr/bin/env ruby

Dir.chdir(File.dirname(__FILE__)+'/..')

# Start the app with Padrino::Server
require 'rubygems'
require 'bundler/setup'
require 'padrino-core/cli/launcher'

ARGV.unshift('start') if ARGV.first.nil? || ARGV.first.start_with?('-')
Padrino::Cli::Launcher.start ARGV

# Start the app with Rack::Server
#require "rack"
#Rack::Server.start
