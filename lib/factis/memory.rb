module Factis
  class Memory

    def self.init_memory!
      @facts = Hash.new
    end

    def self.all_facts
      init_memory! if @facts.nil?
      @facts
    end

    def self.memorize(fact, content, options = {})
      init_memory! if @facts.nil?
      if known_fact?(fact)
        unless options[:overwrite] == true
          raise %{Cannot memorize a fact more than once: '#{fact}'}
        end
      end
      @facts[fact] = content
    end

    def self.known_fact?(fact)
      init_memory! if @facts.nil?
      @facts.keys.include?(fact)
    end

    def self.forget(fact)
      init_memory! if @facts.nil?
      unless known_fact?(fact)
        raise %{Trying to forget an unknown fact: '#{fact}'}
      end
      @facts.delete(fact)
    end

    def self.recall(fact)
      init_memory! if @facts.nil?
      unless known_fact?(fact)
        raise %{Trying to recall an unknown fact: '#{fact}'}
      end
      @facts[fact]
    end

    def self.reset!
      init_memory! if @facts.nil?
      @facts.clear
    end
  end
end
