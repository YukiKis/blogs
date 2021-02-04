module LoginMacros
  def login_user(user)
    reset_session!
    visit new_session_path
    expect(current_path).to eq new_session_path
    fill_in "名前", with: user.name
    fill_in "パスワード", with: user.password
    click_button "ログイン"
  end
  
  def logout_user
    click_link "LOG OUT"
  end
end