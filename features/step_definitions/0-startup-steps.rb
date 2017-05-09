Given(/^a file 'lib\/app\.rb' is loaded$/) do
  expect(require_relative '../../lib/app').to be(true)
end

When(/^I successfully execute `App\.start`$/) do
  allow(App).to receive(:show_menu)
  App::start
  expect(App).to have_received(:show_menu)
end

Then(/^I should see a menu with:$/) do |string|
  pending
end
