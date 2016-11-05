class CreateHouses < ActiveRecord::Migration[5.0]
  def change
    create_table :houses do |t|

      t.timestamps
    end
  end
end
