require "rails_helper"

RSpec.describe "UsersController", type: :system do
  context "on new" do
    before do
      visit new_user_path
    end
    it "is right URL" do
      expect(current_path).to eq new_user_path
    end
    it "has name form" do
      expect(page).to have_field "user[name]"
    end
    it "has password field" do
      expect(page).to have_field "user[password]"
    end
    it "has password_confirmation field" do
      expect(page).to have_field "user[password_confirmation]"
    end
    it "has agreement checkbox" do
      expect(page).to have_field "user[agreement]"
    end
    it "has button to submit" do
      expect(page).to have_button "登録"
    end
    it "successfully create" do
      fill_in "user[name]", with: "yuki"
      fill_in "user[password]", with: "testtest"
      fill_in "user[password_confirmation]", with: "testtest"
      check "OK"
      click_button "登録"
      expect(page).to have_content "登録出来ました"
    end
    it "fails to create" do
      click_button "登録"
      expect(page).to have_content "エラーが発生しました"
    end
  end

end