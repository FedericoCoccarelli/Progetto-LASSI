Feature: Statistics
  In order to see the questions
  As a viewer
  I want to see the links to actions


	Scenario: View links to actions
		Given I am authenticated as admin
  	Given I am on the home page
  	Then I should see link "Logout"
  	Then I should see link "List Users"
  	Then I should see link "My profile"
  	Then I should see link "My questions"
  	Then I should see link "My answers"
  	Then I should see link "Add A New Question"
  		
  Scenario: Add a question
  	Given I am authenticated as admin
  	Given I am on the home page
  	When I follow "Add A New Question"
  	Then I should be on the "Add a New Question" page
  	Then I create a new Question
  	Then I should see link "Edit"
  	Then I should see link "Destroy"
  	Then I should see link "Answers"

  Scenario: Add an answer
  	Given I am authenticated as admin
  	Given I am on the home page
  	When I follow "Add A New Question"
  	Then I should be on the "Add a New Question" page
  	Then I create a new Question
  	Then I should see link "Edit"
  	Then I should see link "Destroy"
  	Then I should see link "Answers"
  	When I follow "Answers"
  	Then I should be on the "Question Details" page
  	Then I create a new Answer
  	Then I should see link "Edit Answer"
  	Then I should see link "Delete Answer"

 	Scenario: List Users Ban an User
 		Given I am authenticated as admin
  	Given I am on the home page
  	When I follow "List Users"
  	Then I should be on the "List Users" page
  	Then I should see table text "Edit" 
  	Then I should see table text "Destroy" 	
