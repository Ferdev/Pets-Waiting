class AddVeterinaryFieldsToPets < ActiveRecord::Migration
  def self.up
    add_column :pets, :sterilized, :boolean, :default => false
    add_column :pets, :vaccinated, :boolean, :default => false
  end

  def self.down
    remove_column :pets, :sterilized
    remove_column :pets, :vaccinated
  end
end
