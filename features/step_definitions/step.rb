require 'devise'
require 'devise/test/integration_helpers'

Given('i am singed in') do
  user = User.create(email: "test@gmail.com",password: "ponziopilato",username:"sonountest")
  user.skip_confirmation!
  user.save!
  visit new_user_session_path
  fill_in "email", with: user.email
  #fill_in "Username", with: user.username
  fill_in "password", with: user.password
  #fill_in "Password confirmation", with: user.password
  click_button "Log in"
  expect(page).to have_current_path(root_path)
  click_link "profilo"
  expect(page).to have_current_path(user_path(user))
  
end



When('i click on {string}') do |button_text|
  click_button(button_text)
  expect(page).to have_current_path(new_book_path)
end

When('i create a generic book') do
  book = Book.create(titolo: "test",trama: "Ecco questa è la trama del libro test scritto",tag: "Amore", genere: "Romanzo")
  fill_in "titolo", with: book.titolo
  fill_in "trama", with: book.trama
  fill_in "tag", with: book.tag
  fill_in "genere", with: book.genere
  click_button "botto2"
end

Then('i should have the book') do
  expect(page).to have_content("Book was successfully created")
end

Given('i search for a account that i have created') do
  user = User.create(email: "test@gmail.com",password: "ponziopilato",username:"sonountest")
  user.skip_confirmation!
  user.save!
  visit new_user_session_path
  fill_in "email", with: user.email
  #fill_in "Username", with: user.username
  fill_in "password", with: user.password
  #fill_in "Password confirmation", with: user.password
  click_button "Log in"
  expect(page).to have_current_path(root_path)
  click_link "profilo"
  click_button "Log out"
  expect(page).to have_current_path(root_path)
  fill_in "searchuser", with: user.username
  click_button "bottoneuser"
  #expect(page).to have_current_path(users_path)
  

  
end

When('i click on the link {string}') do |link_text|
  click_link(link_text)
end

Then('i should be in the profile page') do
  expect(page).to have_current_path(user_path(:id => 1))
end




  