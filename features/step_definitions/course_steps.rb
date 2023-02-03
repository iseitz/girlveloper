Given('I have an account with course creator rights') do
  visit "/"
  click_on "Sign Up"
  fill_in "Email", with: "irenika@gmail.com"
  find_field('Password*').set(123456)

  fill_in "Password confirmation", with: "123456"
  click_on "user-registraion-submit"
  click_on "user-signout"
end

Given('I am logged in') do
  visit "/"
  fill_in "user-email", with: "irenika@gmail.com"
  fill_in "user-password", with: "secret12345"
  click_on "user-logout"
end

When('I create a course record with title and description') do
  visit "/"
  click_on "add_new_course"
  
end

Then('I should see a record of the course and a confirmation message') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I should receive the confirmation via email that I created a new course') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('The course should have a title and the description') do
  pending # Write code here that turns the phrase above into concrete actions
end

