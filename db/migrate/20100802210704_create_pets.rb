class CreatePets < ActiveRecord::Migration
  def self.up
    create_table :pets do |t|
      t.string :name
      t.integer :animal_id
      t.integer :breed_id
      t.date :birthday
      t.date :limit_date
      t.integer :size_id
      t.boolean :urgent
      t.text :description

      # Pet's character flags
      t.boolean :docile
      t.boolean :docile
      t.boolean :calm
      t.boolean :agressive_people
      t.boolean :agressive_animals
      t.boolean :dominant
      t.boolean :affectionate
      t.boolean :independent
      t.boolean :dependent
      t.boolean :possessive
      t.boolean :playful
      t.boolean :tireless
      t.boolean :obedient
      t.boolean :disobedient
      t.boolean :trained
      t.boolean :sleepyhead
      t.boolean :friendly_people
      t.boolean :friendly_animals

      t.timestamps
    end
  end

  def self.down
    drop_table :pets
  end
end
