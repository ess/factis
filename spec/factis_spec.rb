require 'spec_helper'
require 'factis'

class Dummy
  extend Factis
end

describe Factis do
  describe %{DSL} do
    let(:factis) {Dummy}
    let(:fact) {"Joe"}
    let(:content) {"likes pie"}

    before(:each) do
      Factis::Memory.reset!
    end

    describe %{#clear_all_facts!} do
      it %{resets the Factis memory core} do
        Factis::Memory.should_receive(:reset!)
        factis.clear_all_facts!
      end
    end

    describe %{#all_facts} do
      it %{returns the entire fact hash} do
        facts = {fact => content}
        Factis::Memory.should_receive(:all_facts).and_return(facts)
        factis.all_facts.tap do |all_facts|
          all_facts.should be_a(Hash)
          all_facts.should == facts
        end
      end
    end

    describe %{#memorize_fact} do
      it %{stores the provided fact} do
        Factis::Memory.should_receive(:memorize).with(fact, content).and_call_original
        factis.memorize_fact(fact, content)
      end

      it %{returns the content of the provided fact} do
        factis.memorize_fact(fact, content).should == content
      end

      it %{raises an error if the fact is already known} do
        factis.memorize_fact(fact, content)
        lambda {factis.memorize_fact(fact, 'Something else')}.should raise_error
      end
    end

    describe %{#indifferently_memorize_fact} do
      it %{stores the provided fact, even if it's already known} do
        new_content = 'Something else'
        factis.memorize_fact(fact, content)
        lambda {factis.indifferently_memorize_fact(fact, new_content)}.should_not raise_error
        factis.recall_fact(fact).should == new_content
      end
    end

    describe %{#recall_fact} do
      before(:each) {factis.memorize_fact(fact, content)}

      it %{returns the fact content if known} do
        Factis::Memory.should_receive(:recall).with(fact).and_call_original
        factis.recall_fact(fact).should == content
      end

      it %{raises an error if the fact is not known} do
        lambda {factis.recall_fact(:unknown)}.should raise_error
      end
    end

    describe %{#forget_fact} do
      before(:each) {factis.memorize_fact(fact, content)}

      it %{forgets the provided fact if known} do
        Factis::Memory.should_receive(:forget).with(fact).and_call_original
        factis.forget_fact(fact)
        factis.all_facts.keys.include?(fact).should_not be_true
      end

      it %{returns the content of the fact} do
        factis.forget_fact(fact).should == content
      end

      it %{raises an error if the fact is not known} do
        lambda {factis.forget_fact(:unknown)}.should raise_error
      end
    end
  end
end
