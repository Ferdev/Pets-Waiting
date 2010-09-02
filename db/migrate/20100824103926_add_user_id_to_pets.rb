class AddUserIdToPets < ActiveRecord::Migration
  def self.up
    add_column :pets, :user_id, :integer
  end

  def self.down
    remove_column :pets, :user_id
  end
end
