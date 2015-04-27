require 'rails_helper'

RSpec.describe "created category can be destroyed" do
  context "by valid admin" do

    let(:admin) do
      User.create(
        first_name: 'Admin', last_name: 'Admin', username: 'admin1',
        password: 'password', role: 1
      )
    end

    it "destroys the category" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit new_admin_category_path
      fill_in "Name", with: "sports"
      click_link_or_button("Create Category")
      click_link("Delete")
      expect(page).not_to have_content("sports")
      expect(page).to have_content("Successfully deleted category")
    end
  end
end
