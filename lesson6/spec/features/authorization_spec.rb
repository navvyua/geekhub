require 'rails_helper'

feature 'Authorization' do
  context 'with admin permission' do
    scenario 'user enters the admin panel' do
      let(:user) { create(:user, :admin) }

      sign_in user
      click_link 'Admin panel'

      expect(page).to have_content('Users')
      expect(page).to have_content('Exit from admin panel')
    end
  end

  context 'without admin permission' do
    scenario 'user enters the admin panel' do
      let(:user) { create(:user) }

      sign_in user
      visit admin_users_path

      expect(page).to have_content('New post')
    end
  end
end