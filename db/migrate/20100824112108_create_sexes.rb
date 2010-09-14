class CreateSexes < ActiveRecord::Migration
  def self.up
    create_table :sexes do |t|

      t.timestamps
    end
    Sex.create_translation_table! :name => :string
  end

  def self.down
    Sex.drop_translation_table!
    drop_table :sexes
  end
end
