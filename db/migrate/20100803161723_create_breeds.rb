class CreateBreeds < ActiveRecord::Migration
  def self.up
    create_table :breeds do |t|
      t.integer :animal_id

      t.timestamps
    end
  end

  def self.down
    drop_table :breeds
  end
end
