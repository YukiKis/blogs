require "rails_helper"

RSpec.describe "SessionsController", type: :system do
  context "on new" do
    let(:user1){ create(:user1) }
    it "has name field" do
      expect(page).to have_field "user[name]"
    end
    it "has password_field" do
      expect(page).to have_field "user[password]"
    end
    it "has button to login" do
      expect(page).to have_button "ログイン"
    end
    it "successfully login" do
      fill_in "user[name]", with: "yuki"
      fill_in "user[password]", with: "testtest"
      click_button "ログイン"
      expect(page).to have_content "ログインしました"
    end
    it "fails to login" do
      click_button "ログイン"
      expect(page).to have_content "エラー"
    end
  end
end