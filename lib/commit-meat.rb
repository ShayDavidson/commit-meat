require 'commit-meat/installation'
require 'commit-meat/tester'
require 'commit-meat/version'
require 'choice'
require 'colored'

module CommitMeat

  def self.run
    tester  = CommitMeat::Tester.new()
  rescue CommitMeat::NoRepositoryError
    puts 'Error: This is not a Git repository.'.red
  end

end