class CreateDiseasesPetsJoinTable < ActiveRecord::Migration
  def self.up
    create_table :diseases_pets, :id => false do |t|
      t.integer :disease_id
      t.integer :pet_id
    end
  end

  def self.down
    drop_table :diseases_pets
  end
end
