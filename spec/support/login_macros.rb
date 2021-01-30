module LoginMacros
  def login_user(user)
    visit new_session_path
    fill_in "name", with: user.name
    fill_in "password", with: user.password
    click_button "ログイン"
  end
  
  def logout_user
    click_link "LOG OUT"
  end
end