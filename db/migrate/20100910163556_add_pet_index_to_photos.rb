class AddPetIndexToPhotos < ActiveRecord::Migration
  def self.up
    add_index :photos, :pet_id
  end

  def self.down
    remove_index :photos, :pet_id
  end
end
