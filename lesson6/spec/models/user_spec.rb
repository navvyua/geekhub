require 'rails_helper'

describe User do
  it 'has a valid factory' do
    user = build(:user)
    expect(user).to be_valid
  end
end