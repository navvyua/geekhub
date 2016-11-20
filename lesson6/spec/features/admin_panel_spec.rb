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

  scenario 'admin deletes post' do
    create(:post)

    click_link 'Admin panel'
    click_link 'Posts'
    click_link 'Delete'

    expect(Post.all.count).to eq 0
  end

  scenario 'admin creates category' do
    category = build(:category)

    click_link 'Admin panel'
    click_link 'Categories'
    click_link 'New category'

    fill_in 'Name', with: category.name

    click_button 'Create Category'

    expect(page).to have_content(category.name)
    expect(Category.all.count).to eq 1
  end

  scenario 'admin edits category' do
    category = create(:category)

    click_link 'Admin panel'
    click_link 'Categories'
    click_link 'Edit'

    fill_in 'Name', with: 'FakeCategory'

    click_button 'Update Category'

    expect(page).to     have_content('FakeCategory')
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