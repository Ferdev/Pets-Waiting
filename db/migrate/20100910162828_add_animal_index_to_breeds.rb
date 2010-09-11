class AddAnimalIndexToBreeds < ActiveRecord::Migration
  def self.up
    add_index :breeds, :animal_id
  end

  def self.down
    remove_index :breeds, :animal_id
  end
end
