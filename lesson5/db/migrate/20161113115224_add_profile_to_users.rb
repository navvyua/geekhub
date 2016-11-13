class AddProfileToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :profile, index: true
    add_foreign_key :users, :profiles
  end
end
