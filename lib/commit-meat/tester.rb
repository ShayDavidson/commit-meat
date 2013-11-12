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
      check_if :has_only_one_word,  "Single word commit messages are not allowed."
      check_if :includes_bad_words, "Bad words are not allowed in commit messages."
    end

    def check_if(bad_commit_test, failure_message)
      if send(bad_commit_test)
        @failure_messages << failure_message
      end
    end

    ## tests

    def has_only_one_word
      @message.split.size == 1
    end

    def includes_bad_words
      bad_words = YAML::load_file(File.join(File.dirname(File.expand_path(__FILE__)), 'config/bad_words.yml'))
      bad_words_found = []

      bad_words.each do |word|
        bad_words_found << word if @message.include?(word)
      end

      bad_words_found.any?
    end

  end

end
