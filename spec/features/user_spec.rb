require "rails_helper"

describe "User", type: :feature do
  let(:email) { Faker::Internet.email }
  let(:user) { FactoryBot.create :user }

  context "Sign up" do
    before { visit "/" }

    scenario "miss email" do
      click_button("Login / Register")
      expect(page).to have_content("Email can't be blank, Password can't be blank")
    end

    scenario "miss password" do
      click_button("Login / Register")
      expect(page).to have_content("Email can't be blank, Password can't be blank")
    end

    scenario "successfully" do
      expect(page).to have_selector("input[value='Login / Register']")
      page.find("#user_email").set(email)
      page.find("#user_password").set("123456")
      click_button("Login / Register")
      expect(page).to have_content("Welcome! You have signed up successfully.")
    end
  end

  context "Sign in" do
    before { visit "/" }

    context "by user account" do
      scenario "wrong password" do
        expect(page).to have_selector("input[value='Login / Register']")
        page.find("#user_email").set(user.email)
        page.find("#user_password").set("1234567")
        click_button("Login / Register")
        expect(page).to have_content("Invalid Email or password.")
      end

      scenario "successfully" do
        expect(page).to have_selector("input[value='Login / Register']")
        page.find("#user_email").set(user.email)
        page.find("#user_password").set("123456")
        click_button("Login / Register")
        expect(page).to have_content("Signed in successfully.")
      end
    end
  end

  scenario "Sign out" do
    visit "/"
    page.find("#user_email").set(user.email)
    page.find("#user_password").set("123456")
    click_button("Login / Register")
    expect(page).to have_content("Signed in successfully.")
    click_link("Logout")
    expect(page).to have_content("Signed out successfully.")
  end
end
