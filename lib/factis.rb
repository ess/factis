require 'factis/memory'

# This module contains syntactic sugar for the methods in Factis::Memory.
# The purpose is, basically, to make the methods easily injected into,
# say, Cucumber via extend.

module Factis

  # Forget all of the known facts
  # @see Factis::Memory.reset!

  def clear_all_facts!
    Factis::Memory.reset!
  end

  # Returns the entire facts hash
  # @return [Hash] the facts hash
  # @see Factis::Memory.all_facts

  def all_facts
    Factis::Memory.all_facts
  end

  # Memorize the given content, keyed by the given fact key. This wrapper
  # does not allow for overwriting of a fact, and an atttempt to do so will
  # raise an error.
  # @param fact a key suitable for use in a Hash
  # @param content (Object) the content to store
  # @return [Object] the content that was stored
  # @raise [RuntimeError] if the fact key is already in the facts hash
  # @see Factis::Memory.memorize

  def memorize_fact(fact, content)
    Factis::Memory.memorize(fact, content)
  end

  # This method is equivalent to memorize_fact in all ways, save that it
  # disregards the possible existence of the fact key within the internal
  # hash.
  # @note This undermines the goal of *safely* tracking state. Please refrain
  #   from using it if at all possible.
  # @see Factis#memorize_fact
  # @see Factis::Memory.memorize

  def indifferently_memorize_fact(fact, content)
    Factis::Memory.memorize(fact, content, :overwrite => true)
  end

  # Get fact content by key, raising an error for an unknown fact
  # @param fact the key of the fact to retrieve
  # @return [Object] the content of the recalled fact
  # @raise [RuntimeError] if the key is not in the fact hash

  def recall_fact(fact)
    Factis::Memory.recall(fact)
  end

  # Removes the given fact (key) from internal storage, raising an error for
  # an unknown fact
  # @param fact the key of the fact to remove
  # @return [Object] the content of the removed fact
  # @raise [RuntimeError] if the key is not in the fact hash

  def forget_fact(fact)
    Factis::Memory.forget(fact)
  end
end
