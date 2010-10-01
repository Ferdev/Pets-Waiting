class CreatePetDiseases < ActiveRecord::Migration
  def self.up
    create_table :pet_diseases do |t|
      t.integer :pet_id
      t.integer :disease_id

      t.timestamps
    end
    
    add_index :pet_diseases, :pet_id
    add_index :pet_diseases, :disease_id
  end

  def self.down
    drop_table :pet_diseases
  end
end
