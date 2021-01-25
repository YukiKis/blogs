require "rails_helper"

RSpec.describe "UsersController", type: :system do
  let(:user1){ create(:user1) }
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
  context "on show" do
    before do
      login_user(user1)
      visit user_path(user1)
    end
    it "is right URL" do
      expect(current_path).to eq user_path(user1)
    end
    it "has user_name" do
      expect(page).to have_content user1.name
    end
    it "has link to new blog" do
      expect(page).to have_link "ブログを作成する", href: new_blog_path
    end
    it "has blogs list" do
      user1.blogs.each do |blog|
        expect(page).to have_content blog.name
        #expect(page).to have_content blog.articles.count 
      end
    end
  end
  context "on edit" do
    before do
      login_user(user1)
      visit edit_user_path(user1)
    end
    it "is right URL" do
      expect(current_path).to eq edit_user_path(user1)
    end
    it "has name field" do
      expect(page).to have_field "user[name]", with: user1.name
    end
    it "has button to update" do
      expect(page).to have_button "更新"
    end
    it "successully update" do
      fill_in "user[name]", with: "ゆうき"
      click_button "更新"
      expect(page).to have_content "更新に成功しました"
      expect(page).to have_content "ゆうき"
    end
    it "fails to update" do
      fill_in "user[name]", with: ""
      click_button "更新"
      expect(page).to have_content "エラー"
    end
  end
end