require 'rails_helper'

feature 'Admin panel' do
  before(:each) do
    user = create(:user, :admin)
    sign_in user
  end

  scenario 'admin deletes user' do
    create(:user)

    click_link 'Admin panel'
    click_link 'Delete'

    expect(User.all.count).to eq 1
  end
end