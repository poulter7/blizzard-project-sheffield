Feature: Sign up
	In order to allow us to get new users
	A user should be able to sign up

	Scenario: Display sign up page if not already signed in
		When I go to sign up page
		Then I should see "Sign up"

	Scenario: Add a new user
		When I go to sign up
		And I fill in "user_email" with "poulter7@gmail.com"
		And I press "user_submit"
		Then I should see "Listening Test"
