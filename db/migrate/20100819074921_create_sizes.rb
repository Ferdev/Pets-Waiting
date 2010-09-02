class CreateSizes < ActiveRecord::Migration
  def self.up
    create_table :sizes do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :sizes
  end
end
