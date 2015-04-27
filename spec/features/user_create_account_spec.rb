require 'rails_helper'

RSpec.describe "user can be create" do
  context 'with valid info' do

    it "creates user" do
      visit new_user_path
      fill_in "First name", with: "mihir"
      fill_in "Last name", with: "parikh"
      fill_in "Username", with: "username"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_link_or_button "Create User"

      expect(page).to have_content("Welcome mihir")


    end
  end
end
