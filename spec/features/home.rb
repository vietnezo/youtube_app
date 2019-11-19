require "rails_helper"

describe "Home", type: :feature do
  let(:user) { FactoryBot.create :user }

  scenario "Before login" do
    visit "/"
    expect(page).to have_content("Funny Movies")
    expect(page).to have_selector("input[name='user[email]']")
    expect(page).to have_selector("input[name='user[password]']")
    expect(page).to have_selector("input[value='Login / Register']")
    expect(page).to have_css(".movies-list")
  end

  scenario "After login" do
    visit "/"
    page.find("#user_email").set(user.email)
    page.find("#user_password").set("123456")
    click_button("Login / Register")
    expect(page).to have_content("Signed in successfully.")

    expect(page).to have_content("Funny Movies")
    expect(page).to have_content("Welcome, " + user.email)
    expect(page).to have_selector("a[href='/share']")
    expect(page).to have_selector("a[href='/users/sign_out']")
    expect(page).to have_css(".movies-list")
  end
end
