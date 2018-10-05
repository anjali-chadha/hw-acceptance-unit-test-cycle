Feature: Movies General Test Cases
 
  As a movie buff
  So that I can find movies with my favorite director
  I want to include and serach on director information in movies I enter
 
Background: movies in database
 
  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Star Wars    | PG     | George Lucas |   1977-05-25 |
  | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
  | Alien        | R      |              |   1979-05-25 |
  | THX-1138     | R      | George Lucas |   1971-03-11 |
 
Scenario: sort movies in increasing order of title
  # your steps here
  Given I am on the home page
  When I follow "Title"
  Given I should be on the home page
  Then I should see "Alien" before "Star Wars"
 
Scenario: add movie
  Given I am on the home page
  And  I follow "Add new movie"
  Then I am on the new movie page
  When I fill in "Title" with "HarryPotter"
  And I select "R" from "Rating"
  And I press "Save Changes"
  Then I should be on the home page
  And I should see "HarryPotter was successfully created."
 
Scenario: delete movie
  Given I am on the details page for "Star Wars"
  And  I press "Delete"
  Then  I should be on the home page 
  And I should see "Movie 'Star Wars' deleted."