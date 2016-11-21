require 'rails_helper'

feature 'Admin panel' do
  let(:new_category)   { build(:category) }
  let(:edited_name)    { 'edit_name' }

  before(:each) { sign_in create(:user, :admin) }

  scenario 'admin deletes user' do
    create(:user)
    click_link 'Admin panel'
    click_link 'Delete'

    expect(User.all.count).to eq 1
  end

  scenario 'admin deletes post' do
    create(:post)
    click_link 'Admin panel'
    click_link 'Posts'
    click_link 'Delete'

    expect(Post.all.count).to eq 0
  end

  scenario 'admin creates category' do
    click_link 'Admin panel'
    click_link 'Categories'
    click_link 'New category'
    fill_in 'Name', with: new_category.name
    click_button 'Create Category'

    expect(Category.all.count).to eq 1
  end

  scenario 'admin edits category' do
    create(:category)
    click_link 'Admin panel'
    click_link 'Categories'
    click_link 'Edit'
    fill_in 'Name', with: edited_name
    click_button 'Update Category'

    expect(page).to have_content(edited_name)
  end

  scenario 'admin deletes category' do
    create(:category)
    click_link 'Admin panel'
    click_link 'Categories'
    click_link 'Delete'

    expect(Category.all.count).to eq 0
  end
end