require 'rails_helper'

feature 'Authentication' do
  scenario 'user signs out' do
    user = create(:user)

    sign_in user

    click_link 'Logout'

    expect(page).to have_content('Sign In')
  end

  context 'with valid params' do
    scenario 'user signs up' do
      user = build(:user)

      sign_up user

      expect(page).to have_content(user.email)
    end

    scenario 'user signs in' do
      user = create(:user)

     sign_in user

      expect(page).to have_content(user.email)
    end
  end

  context 'with invalid params' do
    let(:user) { build(:user, :invalid) }

    scenario 'user signs up' do
      sign_up user

      expect(page).to have_content('Sign Up')
    end

    scenario 'user signs in' do
      sign_in user

      expect(page).to have_content('Sign In')
    end
  end
end