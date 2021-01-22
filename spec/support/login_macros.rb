module LoginMacros
  def login_user(user)
    visit new_session_path
    fill_in "user[name]", with: user.name
    fill_in "user[password]", with: user.password
    click_button "LOG IN"
  end
  
  def logout_user
    click_link "LOG OUT"
  end
end