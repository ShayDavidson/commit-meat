require 'commit-meat/installation'
require 'commit-meat/version'
require 'commit-meat/tester'
require 'choice'
require 'colored'
require 'yaml'

module CommitMeat

  def self.run
    tester = Tester.new(commit_message)
    tester.test

    if tester.has_failures? || tester.has_warnings?
      puts "There's NO MEAT - did not commit.".pink
      tester.warning_messages.each { |message| puts message.yellow }
      tester.failure_messages.each { |message| puts message.red }
    end

    stop_commit if tester.has_failures?
  end

  private

  def self.commit_message
    message_file = ARGV[0]
    File.read(message_file).strip
  end

  def self.stop_commit
    exit 1
  end

end