#!/usr/bin/env ruby

begin
  require 'commit-meat'
rescue LoadError
  require 'rubygems'
  require 'commit-meat'
end

message_file = ARGV[0]
message = File.read(message_file).strip
puts message.red
exit 1