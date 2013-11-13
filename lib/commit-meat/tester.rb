module CommitMeat

  class Tester

    attr_reader :failure_messages, :warning_messages

    def initialize(message)
      @message = message
      @failure_messages = []
      @warning_messages = []
    end

    def has_messages?
      has_warnings? || has_failures?
    end

    def has_warnings?
      @warning_messages.any?
    end

    def has_failures?
      @failure_messages.any?
    end

    def test
      fail_if :has_only_one_word,  "A single word, really?"
      warn_if :includes_bad_words, "[gets shocked by a V-chip]"
    end

    private

    def fail_if(test, failure_message)
      test_if(test, failure_message, @failure_messages)
    end

    def warn_if(test, warning_message)
      test_if(test, warning_message, @warning_messages)
    end

    def test_if(test, message, message_box)
      if send(test)
        message_box << message
      end
    end


    ## tests

    def has_only_one_word
      @message.split.size == 1
    end

    def includes_bad_words
      bad_words = YAML::load_file(File.join(File.dirname(File.expand_path(__FILE__)), 'config/bad_words.yml'))
      bad_words_whitelist = YAML::load_file(File.join(File.dirname(File.expand_path(__FILE__)), 'config/bad_words_whitelist.yml'))

      words_in_message = @message.split

      bad_words.any? do |bad_word|
        words_in_message.any? do |word|
          if word.include?(bad_word)
            !bad_words_whitelist.any? { |whitelist_word| word.include?(whitelist_word) }
          end
        end
      end

    end

  end
end
