require 'commit-meat/installation'
require 'commit-meat/version'
require 'commit-meat/tester'
require 'choice'
require 'colored'

module CommitMeat

  def self.run
    message_file = ARGV[0]
    message = File.read(message_file).strip
    puts message.green
    Tester.new(message)
    puts 'erm'
    exit 1
  end

end