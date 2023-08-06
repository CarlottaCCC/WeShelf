Feature: Creazione del libro

Scenario:The paramaters are filled in the correct way

Given i am signed in
When i click on "Aggiungi Libro"
And i create a generic book
Then i should have the book

Scenario:I have made a mistake while filling the paramaters

Given i am signed in again
When i click on "Aggiungi Libro" again
And i fail to create a generic book, i leave the title blank
Then i should have an error for the blank title


Scenario:I am not signed in, and i cannot go to profile page for creating a book

Given i am not logged and in home page
Then i cannot click "Vai al tuo profilo"
