require "rails_helper"

describe "Movie", type: :feature do
  let(:user) { FactoryBot.create :user }

  scenario "Share movie without login" do
    visit "/share"
    expect(page).to have_content("You need to sign in or sign up before continuing.")
  end

  context "Share movie" do
    before do
      visit "/"
      expect(page).to have_selector("input[value='Login / Register']")
      page.find("#user_email").set(user.email)
      page.find("#user_password").set("123456")
      click_button("Login / Register")
      expect(page).to have_content("Signed in successfully.")
      click_link("Share a movie")
      expect(page).to have_content("Youtube url")
    end

    scenario "miss url" do
      click_button("Share")
      expect(page).to have_content("Url can't be blank")
    end

    scenario "with invalid url" do
      page.find("#movie_url").set("abc")
      click_button("Share")
      expect(page).to have_content("Url is invalid")
    end

    scenario "successfully" do
      page.find("#movie_url").set("https://www.youtube.com/watch?v=GY7Ps8fqGdc")
      click_button("Share")
      expect(page).to have_content("Share movie successfully.")
    end
  end
end
