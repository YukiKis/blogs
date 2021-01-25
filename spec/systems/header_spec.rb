require "rails_helper"

RSpec.describe "Header", type: :system do
  let(:user1){ create(:user1) }
  before do
    visit root_path
  end
  context "on header when not logged in" do
    it "has link to Home" do
      expect(page).to have_link "Home", href: root_path
    end
    it "has link to About" do
      expect(page).to have_link "About", href: about_path
    end
    it "has link to log in" do
      expect(page).to have_link "LOG IN", href: new_session_path
    end
    it "has link to Register" do
      expect(page).to have_link "SIGN IN", href: new_user_path
    end
  end
  context "on header when logged in" do
    before do
      login_user(user1)
    end
    it "has link to logout" do
      expect(page).to have_link "LOG OUT", href: session_path
    end
    it "successfully logout" do
      click_link "LOG OUT"
      expect(current_path).to eq root_path
      expect(page).to have_content "ログアウトしました。"
    end
  end
end
