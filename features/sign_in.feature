Feature: Sign in
	In order to allow an already registered user to continue their test
	They should be able to sign in and continue.

	Background:
		Given a default user

	Scenario: User with a valid email wants to return
		When I go to the sign in page
		Then I should see "Sign in"
		When I fill in "user_email" with "poulter7@gmail.com"
		And I press "user_submit"
		Then I should see "Listening Test"
		And I should see "Signed in as: poulter7@gmail.com"
		And I should see "Logout"
		And I should see "Home"
		When I go to the home page
		Then I should not see "Home"


	
