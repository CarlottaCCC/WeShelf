require 'devise'
require 'devise/test/integration_helpers'

Given('i am singed in') do
    user = User.create(email: "test@gmail.com",password: "ponziopilato",username:"sonountest")
    visit signup_path
    fill_in "Email", with: user.email
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: user.password
    click_button "Sign up"
    expect(page).to have_current_path(user_registration_path)
end
  
  Given('i am on the profile page') do
    pending # Write code here that turns the phrase above into concrete actions
    visit root_path
    click_link "Vai al tuo profilo"
    expect(page).to have_current_path(user_path)
  end
  
  When('i click on {string}') do |button_text|
    pending # Write code here that turns the phrase above into concrete actions
    #click_button(button_text)
  end
  
  When('i create a generic book') do
    pending # Write code here that turns the phrase above into concrete actions
    #fill_in "Titolo", with: "test"
    #fill_in "Trama", with: "Ecco questa è la trama del libro test scritto"
    #fill_in "Tag", with: "Amore"
    #fill_in "Genere", with: "Romanzo"
    #fill_in "Copertina", with: "features/support/test.jpeg"
    #click_button "Create Book"
    #expect(page).to have_current_path(book_path)
  end
  
  Then('i should have the book') do
    pending # Write code here that turns the phrase above into concrete actions
  end
  