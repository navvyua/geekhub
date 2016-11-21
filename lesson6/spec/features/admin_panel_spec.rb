require 'rails_helper'

feature 'Admin panel' do
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
    let(:category) { build(:category) }

    click_link 'Admin panel'
    click_link 'Categories'
    click_link 'New category'
    fill_in 'Name', with: category.name
    click_button 'Create Category'

    expect(page).to have_content(category.name)
    expect(Category.all.count).to eq 1
  end

  scenario 'admin edits category' do
    let(:category)      { create(:category) }
    let(:fake_category) { 'FakeCategory' }

    click_link 'Admin panel'
    click_link 'Categories'
    click_link 'Edit'
    fill_in 'Name', with: fake_category
    click_button 'Update Category'

    expect(page).to     have_content(fake_category)
    expect(page).to_not have_content(category.name)
  end

  scenario 'admin deletes category' do
    create(:category)
    click_link 'Admin panel'
    click_link 'Categories'
    click_link 'Delete'

    expect(Category.all.count).to eq 0
  end
end