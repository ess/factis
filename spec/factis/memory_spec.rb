require 'spec_helper'
require 'factis/memory'

describe Factis::Memory do

  let(:memory) {Factis::Memory}
  let(:fact) {"Joe"}
  let(:content) {"Likes pie"}

  describe '.all_facts' do
    it 'is a Hash' do
      memory.all_facts.should be_a(Hash)
    end
  end

  describe '.remember' do
    context "when given a fact name and content" do
      it "records the fact" do
        memory.remember(fact, content)
        memory.all_facts.keys.include?(fact).should be_true
        memory.all_facts[fact].should == content
      end
    end
  end

  describe '.known_fact?' do
    before(:each) do
      memory.remember(fact, content)
    end

    it "returns true for known facts" do
      memory.known_fact?(fact).should be_true
    end

    it "returns false for unknown facts" do
      memory.known_fact?(:unknown).should be_false
    end
  end

  describe '.forget' do
    before(:each) do
      memory.remember(fact, content)
    end

    

    it "removes a known fact from memory" do
      memory.forget(fact)
      memory.known_fact?(fact).should be_false
    end

    it "raises an error when given an unknown fact" do
      lambda {memory.forget("unknown fact")}.should raise_error
    end
  end

  describe '.recall' do
    before(:each) do
      memory.remember(fact, content)
    end

    it "returns the content of a known fact" do
      memory.recall(fact).should == content
    end

    it "raises an error when given an unknown fact" do
      lambda {memory.recall(:unknown)}.should raise_error
    end

  end

  describe '.init_memory!' do
    it 'should instantiate a new Hash for the memory' do
      old = memory.all_facts.__id__
      memory.init_memory!
      memory.all_facts.__id__.should_not == old
    end
  end

  describe '.reset!' do
    it 'should clear the memory' do
      memory.remember(fact, content)
      memory.known_fact?(fact).should be_true
      memory.reset!
      memory.known_fact?(fact).should be_false
    end
  end
end
