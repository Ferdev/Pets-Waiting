class AddUrgentIndexToPets < ActiveRecord::Migration
  def self.up
    add_index :pets, :urgent
  end

  def self.down
    remove_index :pets, :urgent
  end
end
