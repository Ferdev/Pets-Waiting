class CreateAdoptions < ActiveRecord::Migration
  def self.up
    say "Creating adoptions table..."
    create_table :adoptions do |t|
      t.references  :pet
      t.references  :adoptant
      t.text        :reasons
      t.boolean     :adopted, :default => false
      
      t.timestamps
    end
    say "... Done!"
    say "Adding indexes to adoptions table..."
    add_index :adoptions, :pet_id
    add_index :adoptions, :adoptant_id
    say "... Done!"
  end

  def self.down
    drop_table :adoptions
  end
end
