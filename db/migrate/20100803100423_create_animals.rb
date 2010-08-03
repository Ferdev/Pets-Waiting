class CreateAnimals < ActiveRecord::Migration
  def self.up
    create_table :animals do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :animals
  end
end
