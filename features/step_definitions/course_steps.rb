Given('I have an account with course creator rights') do
  visit "/"
  click_on "user-registration"
  fill_in "user_email", with: "irenika@gmail.com"
  fill_in "user_password", with: "123456"
  fill_in "user_password_confirmation", with: "123456"
  click_on "user_registration_submit"
  click_on "user_signout"
end

Given('I am logged in') do
  visit "/"
  click_on "user_login"
  expect(page).to have_content("Log in")
  fill_in "user_email", with: "irenika@gmail.com"
  fill_in "user_password", with: "123456"
  click_on "user_signin"
end

When('I create a course record with title and description') do
  visit "/"
  expect(page).to have_content("irenika@gmail.com")
  expect(page).to_not have_content("Log in")
  expect(page).to have_content("Welcome to girlveloper platform. Let's learn something exciting today!")
  expect(page).to have_content("Popular courses")
  click_on "add_new_course"
  expect(page).to have_content("New course")
  fill_in "course_title", with: "My new course for coding 1"
  expect(page).to have_css '.trix-content'
  # expect(page).to have_css 'course_description_trix_input_course'
  find(:xpath, "//*[@id='course_description_trix_input_course']", visible: false).set("long description of my test course")
  # screenshot_and_save_page
  sleep 3
  fill_in "course_short_description", with: "description of my test course"
  click_on "course_submit"
  expect(page).to have_content("Course was successfully created.")
  expect(page).to have_content("My new course for coding 1")
  expect(page).to have_content("description of my test course")
  expect(page).to have_content("Edit")
  expect(page).to have_content("Destroy")
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

