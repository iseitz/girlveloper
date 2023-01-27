Given('I go to the home page') do
  visit "/"
end

Then('I should see a Girlveloper message') do
  expect(page).to have_content("Girlveloper")
end