require 'git'

module CommitMeat

  COMMIT_MESSAGE_HOOK = <<END

#!/usr/bin/env ruby

message_file = ARGV[0]
message = File.read(message_file)

if message.length == 1
  puts "Your commit message cannot be a single word".red
end

END

end