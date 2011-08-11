Feature: Welcome
	In order to great new users
	We present them with some information about the project

	Scenario: Greet a user
		Given I am logged out
		When I go to the home page
		Then I should see "Welcome"
		And I should see "Sign in"
		And I should see "Sign up"

	Scenario: If is signed in offer them to sign in or register
		Given a signed in default user
		When I go to the home page
		Then I should see "Welcome"
		And I should see "Continue to testing"
		And I should see "Logout"
