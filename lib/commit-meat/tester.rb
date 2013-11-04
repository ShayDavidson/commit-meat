require 'git'

module CommitMeat

  class NoRepositoryError < StandardError ; end

  class Tester

    def initialize
      run_tests
    rescue ArgumentError
      raise NoRepositoryError.new
    end

    def run_tests
    rescue Git::GitExecuteError
      false
    end

  end
end