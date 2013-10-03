require 'factis/memory'

module Factis

  def clear_all_facts!
    Factis::Memory.reset!
  end

  def all_facts
    Factis::Memory.all_facts
  end

  def remember_fact(fact, content)
    Factis::Memory.remember(fact, content)
  end

  def recall_fact(fact)
    Factis::Memory.recall(fact)
  end

  def forget_fact(fact)
    Factis::Memory.forget(fact)
  end
end
