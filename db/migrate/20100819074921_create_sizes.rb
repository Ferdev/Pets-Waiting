class CreateSizes < ActiveRecord::Migration
  def self.up
    create_table :sizes do |t|

      t.timestamps
    end
    Size.create_translation_table! :name => :string
  end

  def self.down
    Size.drop_translation_table!
    drop_table :sizes
  end
end
