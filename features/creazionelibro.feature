Feature: Creazione del libro

Scenario:The paramaters are filled in the correct way

Given i am singed in
And i am on the profile page
When i click on "Aggiungi Libro"
And i create a generic book
Then i should have the book
