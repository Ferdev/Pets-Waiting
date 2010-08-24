class AddSexIdToPets < ActiveRecord::Migration
  def self.up
    add_column :pets, :sex_id, :integer
  end

  def self.down
    remove_column :pets, :sex_id
  end
end
