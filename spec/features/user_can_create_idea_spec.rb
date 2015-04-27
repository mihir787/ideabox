require 'rails_helper'

RSpec.describe "user creates ideas" do
  context "user is a valid default user" do
    let(:admin) do
      User.create(
        first_name: 'Admin', last_name: 'Admin', username: 'admin1',
        password: 'password', role: 1
      )
    end

    it "should create an idea" do

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit new_admin_category_path
      fill_in "Name", with: 'pets'
      click_link_or_button 'Create Category'
      expect(page).to have_content('pets')

      visit new_user_path
      fill_in 'First name', with: "Bob"
      fill_in 'Last name', with: "Striker"
      fill_in 'Username', with: "Bob"
      fill_in 'Password', with: "password"
      fill_in 'Password confirmation', with: "password"

      click_link_or_button "Create User"

      visit new_idea_path

      fill_in "Title", with: "dog walker"
      fill_in "Description", with: "made of plastic"
      select('pets', from: 'idea[category_id]')
      click_link_or_button "Create Idea"

      expect(page).to have_content("dog walker")
    end
  end
end
