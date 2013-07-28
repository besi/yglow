When /^I go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

Then /^I should see "([^"]*)"$/ do |value|
  page.should have_text(value)
end

Then /^I should get a response with status (\d+)$/ do |status|
  page.driver.status_code.should == status.to_i
end

# form handling
When /^I press the "([^"]*)" button$/ do |button_name|
  click_button(button_name)
end

Given(/^there are (\d+) devices present$/) do |arg|
  quantity = arg.to_i
  quantity.times do
    Lamp.create!()
  end
  @first_lamp = Lamp.first
  @last_lamp = Lamp.last
  Lamp.count.should == quantity
end

When(/^the devices are activated$/) do
  Lamp.all.each do |lamp|
    lamp.activate()
  end
end
Then(/^a session with (\d+) devices should be created$/) do |quantity|
  Stage.last.lamps.count.should == quantity.to_i
end

When(/^the devices should be in order$/) do

end

When(/^the devices should have a unique identifier$/) do

  identifiers = Set.new

  Stage.last.lamps.each do |lamp|
    identifiers.add lamp.identifier
  end

  identifiers.count.should == Lamp.all.count
end

When(/^all devices should have a different color$/) do

  colors = Set.new
  lamps = Stage.last.lamps
  lamps.each do |lamp|
    colors.add(lamp.color)
  end

  colors.count.should == lamps.count

end

Given(/^there is a pairing present$/) do
  pending
end

When(/^the devices have the colors$/) do |table|
  # table is a |red|
  pending
end

When(/^they rotate their colors$/) do
  pending
end

Then(/^the new order should be$/) do |table|
  # table is a |green|
  pending
end