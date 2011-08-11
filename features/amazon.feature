Feature: Amazon
	Given a user comes in from Amazon they will expect a workflow which is different from that of a standard user.

	Scenario: User visits the Amazon page, but doesn't have a HITID
		Given I go to the amazon page
		Then I should see "Welcome"	
		And I should see "only be viewed"


	Scenario: User has not accepted the hit but enter
		When HITID is "2UWY5COW0LGRB6DHAXCC9VNU2X7X68"  
		And I go to the amazon page
		Then I should see "Welcome"
		And I should not see "only be viewed"
