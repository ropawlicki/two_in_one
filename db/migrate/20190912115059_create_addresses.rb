class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :user, foreign_key: true
      t.integer :house_number
      t.string :street
      t.string :city

      t.timestamps
    end
  end
end
