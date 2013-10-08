module Factis
  class Memory

    class << self
      private
      def init_memory!
        @facts = Hash.new
      end
    end

    # Get the entire facts hash
    #
    # @return [Hash] all facts that have been stored

    def self.all_facts
      init_memory! if @facts.nil?
      @facts
    end

    # Stores content as fact, optionally overwriting said content
    #
    # @param fact the key for the fact hash
    # @param content [Object] the content for the fact
    # @param options [Hash] The only key checked is :overwrite
    #   a boolean defaulting to false.
    #
    # @return [Object] the fact content
    #
    # @raise [RuntimeError] if the fact key is already known and :overwrite
    #   is not active.

    def self.memorize(fact, content, options = {:overwrite => false})
      init_memory! if @facts.nil?
      if known_fact?(fact)
        unless options[:overwrite] == true
          raise %{Cannot memorize a fact more than once: '#{fact}'}
        end
      end
      @facts[fact] = content
    end

    # Determines if the given fact key is already known
    #
    # @param fact the fact key to check
    #
    # @return [Boolean] true if the key is known, false otherwise

    def self.known_fact?(fact)
      init_memory! if @facts.nil?
      @facts.keys.include?(fact)
    end

    # Removes the given fact (key) from internal storage
    #
    # @param fact the key of the fact to remove
    #
    # @return [Object] the content of the removed fact
    #
    # @raise [RuntimeError] if the key is not in the fact hash

    def self.forget(fact)
      init_memory! if @facts.nil?
      unless known_fact?(fact)
        raise %{Trying to forget an unknown fact: '#{fact}'}
      end
      @facts.delete(fact)
    end

    # Get fact content by key
    #
    # @param fact the key of the fact to retrieve
    #
    # @return [Object] the content of the recalled fact
    #
    # @raise [RuntimeError] if the key is not in the fact hash

    def self.recall(fact)
      init_memory! if @facts.nil?
      unless known_fact?(fact)
        raise %{Trying to recall an unknown fact: '#{fact}'}
      end
      @facts[fact]
    end

    # Clear the entire facts hash

    def self.reset!
      init_memory! if @facts.nil?
      @facts.clear
    end
  end
end
