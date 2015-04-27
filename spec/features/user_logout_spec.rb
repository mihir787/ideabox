require 'rails_helper'

RSpec.describe 'user can logout' do
  context 'if user is valid' do

    it 'logs out' do
      User.create(
        first_name: "mike", last_name: "miller", username: "mm",
        password: "password", password_confirmation: "password"
      )

      visit login_path
      fill_in "session[username]", with: "mm"
      fill_in "session[password]", with: "password"
      click_button "Login"

      expect(page).to have_content("Welcome mike")
      click_link_or_button('Logout')
      expect(page).to have_content("Successfully logged out")
    end
  end
end
