require 'rails_helper'

feature 'Authentication' do
  let(:user)             { create(:user) }
  let(:new_user)         { build(:user) }
  let(:new_invalid_user) { build(:user, :invalid) }

  scenario 'user signs out' do
    sign_in user
    click_link 'Logout'
    expect(page).to have_content('Sign In')
  end

  context 'with valid params' do
    scenario 'user signs up' do
      sign_up new_user
      expect(page).to have_content(new_user.email)
    end

    scenario 'user signs in' do
      sign_in user
      expect(page).to have_content(user.email)
    end
  end

  context 'with invalid params' do
    scenario 'user signs up' do
      sign_up new_invalid_user
      expect(page).to have_content('Sign Up')
    end

    scenario 'user signs in' do
      sign_in new_invalid_user
      expect(page).to have_content('Sign In')
    end
  end
end
