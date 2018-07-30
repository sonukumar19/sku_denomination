module UsersHelper
  # method for get user full name
  def user_name
    current_user.first_name.upcase rescue ""
  end
end
