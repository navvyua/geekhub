require 'rails_helper'

feature 'Posts manage' do
  let(:user) { create(:user) }

  context 'with invalid params' do
    let(:post) { build(:post, :invalid) }

    scenario 'user creates post' do
      sign_in user

      click_link 'New post'

      fill_in 'Title', with: post.title
      fill_in 'Text',  with: post.text

      click_button 'Create Post'

      expect(page).to have_content('New post')
      expect(Post.all.count).to eq 0
    end

    scenario 'user edits post' do
      create(:post)
      sign_in user

      click_link 'Edit'

      fill_in 'Text', with: post.text

      click_button 'Update Post'

      expect(page).to have_content('Edit post')
    end

    scenario 'user deletes post' do
      post = create(:post)
      sign_in user

      click_link 'Delete'

      expect(page).to_not have_content(post.title)
      expect(Post.all.count).to eq 0
    end
  end
end