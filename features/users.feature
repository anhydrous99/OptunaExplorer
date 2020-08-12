Feature: Creating and Editing Users
  Tests the creation and editing of user's information

Scenario Outline: Creating a new account
  Given I am not authenticated
  When I go to register
  And I fill in "user_username" with "<username>"
  And I fill in "user[email]" with "<email>"
  And I fill in "user[password]" with "<password>"
  And I fill in "user[password_confirmation]" with "<password>"
  And I press "Sign up"
  Then I should see "A message with a confirmation link has been sent to your email address."
  Then "<email>" should receive an email
  When I open the email
  When I click the first link in the email
  Then I should see "Your email address has been successfully confirmed."

  Examples:
  | username    | email                 | password      |
  | tstuser     | asdf@asdf.com         | asdfasdf      |
  | anhydrous99 | anhydrous99@gmail.com | test_password |
  | gravel      | gravel@outlook.com    | HBfi451kn3n3  |
