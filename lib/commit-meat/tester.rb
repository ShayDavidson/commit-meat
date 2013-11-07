module CommitMeat

  class Tester

    attr_reader :failure_messages

    def initialize(message)
      @message = message
      @failure_messages = []
    end

    def failed?
      @failure_messages.any?
    end

    def test
      test_for_singular_words
    end

    private

    # tests

    def test_for_singular_words
      test_for(@message.split.size > 1, "Single word commit messages are not allowed.")
    end

    # helpers

    def test_for(condition_met, failure_message)
      @failure_messages << failure_message unless condition_met
    end

  end
end
