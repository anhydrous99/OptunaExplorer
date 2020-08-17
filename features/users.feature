Feature: Creating and Editing Users
  Tests the creation and editing of user's information

Scenario Outline: Creating a new account
  Given I am not authenticated
  When I go to register
  And I fill in "user_username" with "<username>"
  And I fill in "user_email" with "<email>"
  And I fill in "user_password" with "<password>"
  And I fill in "user_password_confirmation" with "<password>"
  And I press "Sign up"
  Then I should see "A message with a confirmation link has been sent to your email address."
  Then "<email>" should receive an email
  When I open the email
  When I click the first link in the email
  Then I should see "Your email address has been successfully confirmed."
  Examples:
  | username  | email               | password      |
  | tstuser   | asdf@asdf.com       | asdfasdf      |
  | anhydrous | anhydrous@gmail.com | test_password |
  | gravel    | gravel@outlook.com  | HBfi451kn3n3  |
  | 81818     | d9fs9e@live.com     | Ob9i2#RnVqps  |

Scenario: Resend Confirmation Email
  Given I am not authenticated
  When I go to register
  And I fill in "user_username" with "asdfasdf"
  And I fill in "user_email" with "asdf@example.com"
  And I fill in "user_password" with "asdfasdf"
  And I fill in "user_password_confirmation" with "asdfasdf"
  And I press "Sign up"
  Then I should see "A message with a confirmation link has been sent to your email address."
  Then I visit the Resend Confirmation Page
  And I fill in "user_email" with "asdf@example.com"
  And I press "Resend confirmation instructions"
  Then "asdf@example.com" should receive 2 emails with subject "Confirmation instructions"

Scenario Outline: Login with username
  Given a valid user with username "<username>" and password "<password>"
  When I go to the login page
  And I fill in "user_login" with "<username>"
  And I fill in "user_password" with "<password>"
  And I press "Log in"
  Then I should see "Signed in successfully."
  Examples:
  | username  | password      |
  | tstuser   | asdfasdf      |
  | anhydrous | test_password |

Scenario Outline: Login with username
  Given a valid user with email "<email>" and password "<password>"
  When I go to the login page
  And I fill in "user_login" with "<email>"
  And I fill in "user_password" with "<password>"
  And I press "Log in"
  Then I should see "Signed in successfully."
  Examples:
  | email               | password      |
  | asdf@asdf.com       | asdfasdf      |
  | anhydrous@gmail.com | test_password |

Scenario: Forgot your password
  Given a valid user with email "tst@example.com" and password "asdfasdf"
  When I go to the Forgot your password page
  And I fill in "user_email" with "tst@example.com"
  And I press "Send me reset password instructions"
  Then "tst@example.com" should receive an email
  When I open the email
  When I click the first link in the email
  Then I should see "Change your password"
  And I fill in "user_password" with "asdfasdf2"
  And I fill in "user_password_confirmation" with "asdfasdf2"
  And I press "Change my password"
  Then I should see "Your password has been changed successfully."
  Then the user's password should have changed
