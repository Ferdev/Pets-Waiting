class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string :address
      t.string :street
      t.string :postal_code
      t.string :lat
      t.string :lon
      t.string :country
      t.string :country_code
      t.string :state
      t.string :substate
      t.string :city
      t.integer :user_id
      t.integer :pet_id

      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
