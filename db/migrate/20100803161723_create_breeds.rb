class CreateBreeds < ActiveRecord::Migration
  def self.up
    create_table :breeds do |t|
      t.integer :animal_id

      t.timestamps
    end
    Breed.create_translation_table! :name => :string
  end

  def self.down
    Breed.drop_translation_table! :name => :string
    drop_table :breeds
  end
end
