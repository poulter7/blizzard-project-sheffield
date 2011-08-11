Then /^database should have (\d+) user(?:|s)$/ do |count|
  assert User.find(:all).count()==count, "database already had items in it"
end

When /^HITID is "(.+)"$/ do |id|
  params = Hash[:hitId => id]
end

Then /^I should see "([^"]*)"$/ do |text|
    page.should have_content(text)
end

Then /^(?:|I )should see \/([^\/]*)\/$/ do |regexp|
  regexp = Regexp.new(regexp)

  if page.respond_to? :should
    page.should have_xpath('//*', :text => regexp)
  else
    assert page.has_xpath?('//*', :text => regexp)
  end
end

Then /^(?:|I )should not see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_no_content(text)
  else
    assert page.has_no_content?(text)
  end
end

Then /^(?:|I )should not see \/([^\/]*)\/$/ do |regexp|
  regexp = Regexp.new(regexp)

  if page.respond_to? :should
    page.should have_no_xpath('//*', :text => regexp)
  else
    assert page.has_no_xpath?('//*', :text => regexp)
  end
end

Given /^a default user$/ do
  Given %(a user "poulter7@gmail.com")
end

Given /^I sign up as "(.^)"$/ do
  sign_up_as($1)
end

Given /^a signed in default user$/ do
  sign_up_as('poulter7@gmail.com')
  visit root_path
end

def sign_up_as(user)
  visit new_user_session_path
  fill_user_form_as(user)
end

def sign_in_as(user)
  visit user_session_path
  fill_user_form_as(user)
end

def fill_user_form_as(user)
  fill_in 'user_email', :with => user
  click_button 'user_submit'
  visit destroy_user_session_path 
end

Given /^I click the "([^"]*)" button$/ do |button|
  click_button(button)
end


Given /^a user "([^"]*)"$/ do |email|
  visit new_user_session_path
  And %(I fill in "user_email" with "#{email}")
  And %(I press "user_submit")
  visit destroy_user_session_path
end

Given /^I logout$/ do
  visit destroy_user_session_path
end

Given /^I am logged out$/ do
  visit destroy_user_session_path 
end

When /^I answer (\d+) scale question(?:|s)$/ do |count|
  count.to_i.times { |n| 
  When %(I press "answer_submit")
  }
end
