#!/usr/bin/env ruby

begin
  require 'commit-meat'
rescue LoadError
  require 'rubygems'
  require 'commit-meat'
end

def assert_with_message(condition, msg)
  unless condition
    puts msg.yellow
    exit 1
  end
end

message_file = ARGV[0]
message = File.read(message_file).strip

assert_with_message('Single word commit messages are not allowed.', message.split.size > 1)