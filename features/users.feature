Feature: Users
	View current users and individual users.

	Background:
		Given a signed in default user
		Given I logout
		When I go to the users page


	Scenario: View current users
		Then I should see "poulter7@gmail.com"

	Scenario: View a specific user
		When I go to the users page
		Then I should see "poulter7@gmail.com"
		When I follow "[Show]"
		And I should see "Participated in"
		And I should see "listening test id: "
		And I should see "Section 1 0/3"

