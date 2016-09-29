require "rails_helper"

feature "Users SignUp" do
  context "when user provides valid data" do
    before do
      visit "/signup"
      fill_in(:name, with: "Name")
      fill_in(:email, with: "email@gmail.com")
      fill_in(:password, with: "password")
      click_on("Sign Up")
    end

    scenario "creates new user" do
      expect(User.count).to eq(1)
    end

    scenario "redirects user to home page" do
      expect(page).to have_content("Welcome Name")
    end
  end

  context "when user provides invalid data" do
    before do
      visit "/signup"
      fill_in(:name, with: "")
      fill_in(:email, with: "email")
      fill_in(:password, with: "password")
      click_on("Sign Up")
    end

    scenario "does not create user" do
      expect(User.count).to eq(0)
    end

    scenario "displays form errors" do
      expect(page).to have_content("Errors")
    end
  end
end