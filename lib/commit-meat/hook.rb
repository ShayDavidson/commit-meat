require 'git'

module CommitMeat

  COMMIT_MESSAGE_HOOK = <<END

#!/usr/bin/env ruby
message_file = ARGV[0]
message = File.read(message_file)

#starts with # then number, space, and at least 5 words no more than 200
$regex = /(^#[0-9]+ \W*(\w+(\W+|$)){5,200})/

if !$regex.match(message)
puts "Your message is not formatted correctly (example: #XXX at least 5 words)"
exit 1
end

END

end