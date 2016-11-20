class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :avatar
      t.date :birthday
      t.boolean :gender

      t.timestamps null: false
    end
  end
end
