require 'rails_helper'

feature 'Admin panel' do
  let(:admin_user) { create(:user, :admin) }
  before(:each) { sign_in admin_user }

  context 'list of users' do
    let!(:sample_user) { create(:user) }

    scenario 'admin deletes user' do
      click_link 'Admin panel'
      click_link 'Delete'

      expect(page).to_not have_content(sample_user.email)
    end
  end

  context 'list of posts' do
    let!(:sample_post) { create(:post) }

    scenario 'admin deletes post' do
      click_link 'Admin panel'
      click_link 'Posts'
      click_link 'Delete'

      expect(page).to_not have_content(sample_post.title)
    end
  end

  context 'list of categories' do
    let(:new_category)     { build(:category) }
    let(:edited_name)      { 'edit_name' }
    let!(:sample_category) { create(:category) }

    scenario 'admin creates category' do
      click_link 'Admin panel'
      click_link 'Categories'
      click_link 'New category'
      fill_in 'Name', with: new_category.name
      click_button 'Create Category'

      expect(page).to have_content(new_category.name)
    end

    scenario 'admin edits category' do
      click_link 'Admin panel'
      click_link 'Categories'
      click_link 'Edit'
      fill_in 'Name', with: edited_name
      click_button 'Update Category'

      expect(page).to have_content(edited_name)
    end

    scenario 'admin deletes category' do
      click_link 'Admin panel'
      click_link 'Categories'
      click_link 'Delete'

      expect(page).to_not have_content(sample_category.name)
    end
  end
end
