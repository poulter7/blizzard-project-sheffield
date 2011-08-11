Feature: Sign up
	In order to allow us to get new users
	A user should be able to sign up

	Scenario: Display sign up page if not already signed in
		When I go to the sign up page
		Then I should see "Sign up"
	
	Scenario: Sign up
		Given I sign up as "poulter7@gmail.com"
		Then I should see "Listening Test"

	Scenario: Add a new user
		When I go to the sign up page
		And I fill in "user_email" with "poulter7@gmail.com"
		And I click the "user_submit" button
		Then I should see "Listening Test"
