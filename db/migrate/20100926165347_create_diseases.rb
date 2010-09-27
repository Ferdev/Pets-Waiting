class CreateDiseases < ActiveRecord::Migration
  def self.up
    create_table :diseases do |t|
      t.integer :animal_id

      t.timestamps
    end
    Disease.create_translation_table! :name => :string
  end

  def self.down
    Disease.drop_translation_table!
    drop_table :diseases
  end
end
