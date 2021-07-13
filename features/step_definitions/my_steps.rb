Given(/^I am on the home page$/) do
  visit "/"
end

Given(/^I am authenticated as admin$/) do

  u = User.create!(:email=>"utentetest@gmail.com", 
  :password => "password",:coolness => 3 )

  visit "/"
  fill_in "Email", with: "utentetest@gmail.com"
  fill_in "Password", with: "password"
  click_button "Log in"
  expect(page).to have_text("Logged in as utentetest@gmail.com")
end

Given(/^I am authenticated as banned user$/) do

  u = User.create!(:email=>"utentetest@gmail.com", 
  :password => "password",:coolness => 0 )

  visit "/"
  fill_in "Email", with: "utentetest@gmail.com"
  fill_in "Password", with: "password"
  click_button "Log in"
  expect(page).to have_text("Logged in as utentetest@gmail.com")
end

Then(/^I should see link "(.*?)"$/) do |arg1|
  expect(page).to have_link(text:/\A#{arg1}\Z/)
end

Then(/^I should see table text "(.*?)"$/) do |arg1|
  expect(page).to have_selector('tr',text:arg1)
end

When(/^I follow "(.*?)"$/) do |arg1|
  click_link(text:/\A#{arg1}\Z/)
end

Then('I should be on the "Add a New Question" page') do 
  current_path = URI.parse(current_url).path
  current_path == '/Questions/new'
end

Then('I should be on the "List Users" page') do 
  current_path = URI.parse(current_url).path
  current_path == '/Questions/new'
end

Then('I should be on the "Question Details" page') do 
  current_path = URI.parse(current_url).path
  current_path == '/users'
end

Then('I create a new Question') do 
  fill_in "Title", with: "Titolo1"
  fill_in "Body", with: "body1"
  click_button "Create Question"

  expect(page).to have_text("Title: Titolo1")
end

Then('I create a new Answer') do 
  fill_in "Body", with: "answer1"
  click_button "Save Answer"

  expect(page).to have_text("Title: Titolo1")
end