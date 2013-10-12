require 'spec_helper'
require 'factis/memory'

describe Factis::Memory do

  let(:memory) {Factis::Memory}
  let(:fact) {"Joe"}
  let(:content) {"Likes pie"}

  before(:each) do
    Factis::Memory.reset!
  end

  describe '.all_facts' do
    it 'is a Hash' do
      memory.all_facts.should be_a(Hash)
    end
  end

  describe %{.memorize} do
    let(:new_content) {'Something else'}
    it %{records a fact when given a name and some content} do
      memory.memorize(fact, content)
      memory.all_facts.keys.include?(fact).should be_true
      memory.all_facts[fact].should == content
    end

    it %{returns the content of the fact} do
      memory.memorize(fact, content).should == content
    end

    it %{raises an error when given a known fact} do
      memory.memorize(fact, content)
      lambda {memory.memorize(fact, new_content)}.should raise_error
    end

    it %{allows a fact to be explicitly over-written} do
      memory.memorize(fact, content)
      lambda {memory.memorize(fact, new_content, overwrite: true)}.should_not raise_error
      memory.recall(fact).should == new_content

    end
  end

  describe %{.known_fact?} do
    before(:each) do
      memory.memorize(fact, content)
    end

    it %{returns true for known facts} do
      memory.known_fact?(fact).should be_true
    end

    it %{returns false for unknown facts} do
      memory.known_fact?(:unknown).should be_false
    end
  end

  describe %{.forget} do
    before(:each) do
      memory.memorize(fact, content)
    end

    it %{removes a known fact from memory} do
      memory.forget(fact)
      memory.known_fact?(fact).should be_false
    end

    it %{returns the content of the fact} do
      memory.forget(fact).should == content
    end

    it %{raises an error when given an unknown fact} do
      lambda {memory.forget("unknown fact")}.should raise_error
    end
  end

  describe %{.recall} do
    before(:each) do
      memory.memorize(fact, content)
    end

    it %{returns the content of a known fact} do
      memory.recall(fact).should == content
    end

    it %{raises an error when given an unknown fact} do
      lambda {memory.recall(:unknown)}.should raise_error
    end

  end

  describe %{.reset!} do
    it %{should clear the memory} do
      memory.memorize(fact, content)
      memory.known_fact?(fact).should be_true
      memory.reset!
      memory.known_fact?(fact).should be_false
    end
  end
end
