require 'rails_helper'

RSpec.describe 'admin updates category' do
  context 'if admin is valid' do

    let(:admin) do
      User.create(
        first_name: 'Admin', last_name: 'Admin', username: 'admin1',
        password: 'password', role: 1
      )
    end

    it"updates a category name on category listing page" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit new_admin_category_path
      fill_in "Name", with: 'tech'
      click_link_or_button "Create Category"
      expect(page).to have_content('tech')
      click_link_or_button "Update"
      fill_in "Name", with: 'sports'
      click_link_or_button 'Update Category'
      expect(page).to have_content('sports')
      expect(page).not_to have_content('tech')
    end
  end
end
