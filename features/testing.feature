Feature: Testing
	A new user should be given a default test which they should be able to complete and then return to the testing page and see that the test is completed.

	Background:
		Given a default user
		And a signed in default user
		And I go to the testing page

	Scenario: User has signed in and wants to take their default test
		Then I should see "Listening Test"
		And I should see "Section 1"
		When I follow "Section 1"
		Then I should see "Section 1"
		#		And I should see "Question 1"
		#And I should see "Question 2"
		#When I follow "Question 1"
		#Then I should see "whoami?"
		
	Scenario: User should be able to see questions with different number of subjects
		When I follow "Default Section"
		#Then I follow "Question"
		#Then I should see "# 1"
		#Then I should see "Jimminy Cricket"
		#Then I should see "Davie Crocket"
		#When I go to the testing page
		#And I follow "Default Section"
		#And I follow "Question 2"
		#Then I should see "Jimminy Cricket"
		#And I should not see "Davie Crocket"

	Scenario: User should be able to submit an answer to a question and move onto the next question
		When I follow "Default Section"
		And I follow "Question 1"
		Then the "answer" field should contain "A"
