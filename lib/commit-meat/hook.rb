module CommitMeat

  COMMIT_MESSAGE_HOOK = <<END

#!/usr/bin/env ruby

message_file = ARGV[0]
message = File.read(message_file)
puts message.green
if message.length == 1
  puts "Your commit message cannot be a single word".red
  exit 1
end

END

end