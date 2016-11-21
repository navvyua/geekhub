require 'rails_helper'

feature 'Authorization' do
  let(:admin_user) { create(:user, :admin) }
  let(:user)       { create(:user) }

  context 'with admin permission' do
    scenario 'user enters the admin panel' do
      sign_in admin_user
      click_link 'Admin panel'
      expect(page).to have_content('Exit from admin panel')
    end
  end

  context 'without admin permission' do
    scenario 'user enters the admin panel' do
      sign_in user
      visit admin_users_path
      expect(page).to have_content('New post')
    end
  end
end