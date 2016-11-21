require 'rails_helper'

feature 'Posts manage' do
  let(:user)             { create(:user) }
  let(:new_invalid_post) { build(:post, :invalid) }
  let(:new_post)         { build(:post) }
  let(:edited_text)      { 'edited_text' }

  context 'with invalid params' do
    scenario 'user creates post' do
      sign_in user
      click_link 'New post'
      fill_in 'Title', with: new_invalid_post.title
      fill_in 'Text',  with: new_invalid_post.text
      click_button 'Create Post'

      expect(Post.all.count).to eq 0
    end

    scenario 'user edits post' do
      create(:post)
      sign_in user
      click_link 'Edit'
      fill_in 'Text', with: new_invalid_post.text
      click_button 'Update Post'

      expect(page).to have_content('Edit post')
    end
  end

  context 'with valid params' do
    scenario 'user creates post' do
      sign_in user
      click_link 'New post'
      fill_in 'Title', with: new_post.title
      fill_in 'Text',  with: new_post.text
      click_button 'Create Post'

      expect(Post.all.count).to eq 1
    end

    scenario 'user edits post' do
      create(:post)
      sign_in user
      click_link 'Edit'
      fill_in 'Text', with: edited_text
      click_button 'Update Post'

      expect(page).to have_content(edited_text)
    end

    scenario 'user deletes post' do
      create(:post)
      sign_in user
      click_link 'Delete'
      expect(Post.all.count).to eq 0
    end
  end
end