module Helpers
  def user_sign_in
    user = User.find_by username: 'testuser'
    sign_in user
    user
  end
end
