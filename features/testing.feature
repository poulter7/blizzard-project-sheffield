Feature: Testing
	A new user should be given a default test which they should be able to complete and then return to the testing page and see that the test is completed.

	Background:
		Given a signed in default user
		Given I go to the testing page

	Scenario: User has signed in and wants to take the first section of the test
		Then I should see "Listening Test"
		And I should see "Section 1 0/3"
		When I follow "Section 1"
		Then I should see "Question 1/3"
		And the "input" field should contain "1"
		When I press "answer_submit"
		Then I should see "Question 2/3"
		When I press "answer_submit"
		Then I should see "Question 3/3"
		When I press "answer_submit"
		Then I should see "Listening Test"
		And I should see "Section 1 3/3"
		
	Scenario: User should be able to answer all of the questions in the default test
		Then I should see "Section 2 0/5"
		When I follow "Section 2"
		And I answer 5 scale questions
		Then I should see "Section 2 5/5"

	Scenario: User should be able to submit an answer to a question and move onto the next question
