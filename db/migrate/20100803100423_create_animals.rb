class CreateAnimals < ActiveRecord::Migration
  def self.up
    create_table :animals do |t|

      t.timestamps
    end
    Animal.create_translation_table! :name => :string
  end

  def self.down
    Animal.drop_translation_table!
    drop_table :animals
  end
end
