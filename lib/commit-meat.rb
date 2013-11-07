require 'commit-meat/installation'
require 'commit-meat/version'
require 'commit-meat/tester'
require 'choice'
require 'colored'

module CommitMeat

  def self.run
    message_file = ARGV[0]
    message = File.read(message_file).strip

    tester = Tester.new(message)

    tester.test
    if tester.failed?
      fail_with_message(tester.failure_messages)
    end
  end

  private

  def self.fail_with_message(messages)
    puts "There's NO MEAT - did not commit.".red
    messages.each do
      puts message.yellow
    end
    exit 1
  end

end