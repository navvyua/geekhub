class CreateBoats < ActiveRecord::Migration[5.0]
  def change
    create_table :boats do |t|
      t.string :model

      t.timestamps
    end
  end
end
