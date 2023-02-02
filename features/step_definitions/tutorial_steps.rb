Given('I have an account') do
  visit "/"
  click_on "signup", with: ""
  fill_in "user-email", with: "irenika@gmail.com"
  fill_in "user-password", with: "secret12345"
  click_on "user-registraion-submit"
  click_on "user-signout"
end

Given('I am logged in') do
  visit "/"
  fill_in "user-email", with: "irenika@gmail.com"
  fill_in "user-password", with: "secret12345"
  click_on "user-logout"
end

When('I create a tutorial') do
  visit "/"
  click_on ""
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I should see a record of the tutorial and a confirmation message') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I should receive the confirmation via email that I created a new tutorial') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('The tutorial should have a title and the description') do
  pending # Write code here that turns the phrase above into concrete actions
end