class AddCreatedAtIndexToPets < ActiveRecord::Migration
  def self.up
    add_index :pets, :created_at
  end

  def self.down
    remove_index :pets, :created_at
  end
end
