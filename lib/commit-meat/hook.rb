module CommitMeat

  COMMIT_MESSAGE_HOOK = <<END

#!/usr/bin/env sh
ps -p $$

END

end