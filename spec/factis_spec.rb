require 'spec_helper'
require 'factis'

describe Factis do
  describe %{DSL} do
    let(:factis) {Object.new.send(:extend, subject)}
    let(:fact) {"Joe"}
    let(:content) {"likes pie"}

    describe %{#clear_all_facts!} do
      it %{resets the Factis memory core} do
        Factis::Memory.should_receive(:reset!)
        factis.clear_all_facts!
      end
    end

    describe %{#all_facts} do
      it %{returns the contents of the Factis memory core} do
        facts = {fact => content}
        Factis::Memory.should_receive(:all_facts).and_return(facts)
        factis.all_facts.should == facts
      end
    end

    describe %{#remember_fact} do
      it %{stores the provided fact} do
        Factis::Memory.should_receive(:remember).with(fact, content).and_call_original
        factis.remember_fact(fact, content)
      end
    end

    describe %{#recall_fact} do
      before(:each) {factis.remember_fact(fact, content)}

      it %{recalls the provided fact if known} do
        Factis::Memory.should_receive(:recall).with(fact).and_call_original
        factis.recall_fact(fact).should == content
      end

      it %{raises an error if the fact is not known} do
        lambda {factis.recall_fact(:unknown)}.should raise_error
      end
    end

    describe %{#forget_fact} do
      before(:each) {factis.remember_fact(fact, content)}

      it %{forgets the provided fact if known} do
        Factis::Memory.should_receive(:forget).with(fact).and_call_original
        factis.forget_fact(fact)
        factis.all_facts.keys.include?(fact).should_not be_true
      end

      it %{raises an error if the fact is not known} do
        lambda {factis.forget_fact(:unknown)}.should raise_error
      end
    end
  end
end
