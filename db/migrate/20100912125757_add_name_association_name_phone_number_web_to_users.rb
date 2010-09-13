class AddNameAssociationNamePhoneNumberWebToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :name, :string
    add_column :users, :association_name, :string
    add_column :users, :phone_number, :string
    add_column :users, :web, :string
  end

  def self.down
    remove_column :users, :name
    remove_column :users, :association_name
    remove_column :users, :phone_number
    remove_column :users, :web
  end
end
