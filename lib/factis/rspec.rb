require 'factis'

RSpec.configure do |config|
  config.include Factis
  config.after(:each) do
    puts "let's clear the facts!"
    clear_all_facts!
  end
end
