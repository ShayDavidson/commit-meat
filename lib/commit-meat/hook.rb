module CommitMeat

  COMMIT_MESSAGE_HOOK = <<END

#!/usr/bin/env sh

echo "This is bash!"

/usr/bin/env ruby <<-EORUBY

  puts 'This is ruby!'

EORUBY

END

end