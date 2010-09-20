class AddAdoptedIndexToAdoptions < ActiveRecord::Migration
  def self.up
    add_index :adoptions, :adopted
  end

  def self.down
    remove_index :adoptions, :adopted
  end
end
