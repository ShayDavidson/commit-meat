#!/usr/bin/env ruby

begin
  require 'commit-meat'
rescue LoadError
  require 'rubygems'
  require 'commit-meat'
end

def assert_with_message(condition, msg)
  (puts msg.yellow) and (exit 1) unless condition
end

message_file = ARGV[0]
message = File.read(message_file).strip

puts message.split.size > 1
assert_with_message('Single word commit messages are not allowed.', message.split.size > 1)