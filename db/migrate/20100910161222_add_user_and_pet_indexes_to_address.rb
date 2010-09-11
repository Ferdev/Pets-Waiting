class AddUserAndPetIndexesToAddress < ActiveRecord::Migration
  def self.up
    add_index :addresses, :user_id
    add_index :addresses, :pet_id
  end

  def self.down
    remove_index :addresses, :user_id
    remove_index :addresses, :pet_id
  end
end
