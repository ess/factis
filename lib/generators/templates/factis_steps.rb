# These steps were installed by the Factis install generator to help get you
# started. You probably shouldn't really use these, and you should probably
# even go as far as to delete this file. Think of it the same way you'd think
# about the very far removed web_steps.rb from older versions of Cucumber.

Given %r{^I remember (.*?) is "(.*?)"$} do |fact, content|
  remember_fact(fact, content)
end

Then %r{^I should recall (.*?) as "(.*?)"$} do |fact, expected_content|
  recall_fact(fact).should == expected_content
end

When %r{^I forget (.*?)$} do |fact|
  forget_fact(fact)
end

When %{I clear the facts memory} do
  clear_all_facts!
end
