Given(/^a file 'lib\/app\.rb' is loaded$/) do
  pending
end

When(/^I successfully execute `App\.start`$/) do
  pending
end

Then(/^I should see a menu with:$/) do |string|
  pending
end

Given(/^a file 'lib\/app\.rb' exists$/) do
  File.new('lib/app.rb').readline == 'class App\n'
end

When(/^I successfully execute '(ruby\s.+\.rb\s.+)'$/) do |rb|
  command = rb.split.join "' '"
  expect(system('\'command\'')).to be(true)
end

Then(/^it should exit$/) do

end
