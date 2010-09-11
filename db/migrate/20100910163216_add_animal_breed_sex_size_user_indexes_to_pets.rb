class AddAnimalBreedSexSizeUserIndexesToPets < ActiveRecord::Migration
  def self.up
    add_index :pets, :animal_id
    add_index :pets, :breed_id
    add_index :pets, :sex_id
    add_index :pets, :size_id
    add_index :pets, :user_id
  end

  def self.down
    remove_index :pets, :animal_id
    remove_index :pets, :breed_id
    remove_index :pets, :sex_id
    remove_index :pets, :size_id
    remove_index :pets, :user_id
  end
end
