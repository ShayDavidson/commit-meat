module CommitMeat

  class Tester

    extend Tests

    attr_reader :failure_messages

    def initialize(message)
      @message = message
      @failure_messages = []
    end

    def failed?
      @failure_messages.any?
    end

    def test
      check_if :has_only_one_word,  "Single word commit messages are not allowed."
      check_if :includes_bad_words, "Bad words %"
    end

    def check_if(bad_commit_test, failure_message)
      @failure_messages << failure_message unless send(bad_commit_test)
    end

  end

  module Tests

    def has_only_one_word
      @message.split.size > 1
    end

    def includes_bad_words
      true
    end

  end
end
