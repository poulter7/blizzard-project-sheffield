Then /^database should have (\d+) user(?:|s)$/ do |count|
  assert User.find(:all).count()==count, "database already had items in it"
end

Given /^a default user$/ do
  Given %(a user "poulter7@gmail.com")
end

Given /^a signed in default user$/ do
  Given %(a user "poulter7@gmail.com")
  And %(I go to sign in)
  And %(I fill in "user_email" with "poulter7@gmail.com")
  And %(I press "user_submit")
  visit root_path
end

Given /^a user "([^"]*)"$/ do |email|
  When %(I go to sign up)
  And %(I fill in "user_email" with "#{email}")
  And %(I press "user_submit")
  And %(I logout)
end

Given /^I logout$/ do
  visit destroy_user_session_path
end

Given /^I am logged out$/ do
    %(I logout)
end


#Given /^I am signed in$/ do
#  When %(I sign in as default@gmail.com)
#end

#Given 

#When /^I sign in as (.+)$/ do |email|
#end 

