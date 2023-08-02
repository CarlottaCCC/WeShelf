Feature: Visita di un profilo

Scenario: Visit correctly performed by a guest

Given i search for a account that i have created
When i click on the link "Vai al profilo"
Then i should be in the profile page
