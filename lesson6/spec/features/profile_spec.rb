require 'rails_helper'

feature 'Profile' do
  scenario 'user edits profile' do
    user = create(:user)
    profile = build(:profile)

    sign_in user

    click_link 'Profile'
    click_link 'Edit profile'

    fill_in 'First name', with: profile.first_name

    click_button 'Update Profile'

    expect(page).to     have_content(profile.first_name)
  end
end
