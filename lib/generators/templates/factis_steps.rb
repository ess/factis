Given %r{^I remember (.*?) is "(.*?)"$} do |fact, content|
  remember_fact(fact, content)
end

Then %r{^I should recall (.*?) as "(.*?)"$} do |fact, expected_content|
  @remembered_fact.should == expected_content
end

