#!/usr/bin/env ruby

begin
  require 'commit-meat'
rescue LoadError
  require 'rubygems'
  require 'commit-meat'
end

def assert_with_message(condition, msg)
  unless condition
    puts "There's NO MEAT - did not commit.".red
    puts msg.yellow
    exit 1
  end
end

message_file = ARGV[0]
message = File.read(message_file).strip

assert_with_message(message.split.size > 1, 'Single word commitd messages are not allowed.')