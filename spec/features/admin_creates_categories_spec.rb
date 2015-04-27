require 'rails_helper'

RSpec.describe 'admin creates categories' do
  context 'with admin logged in' do

    let(:admin) do
      User.create(
        first_name: 'Admin', last_name: 'Admin', username: 'admin1',
        password: 'password', role: 1
      )
    end

    it 'displays category listing' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit new_admin_category_path
      fill_in "Name", with: 'tech'
      click_link_or_button 'Create Category'
      expect(page).to have_content('tech')
    end
  end
end
