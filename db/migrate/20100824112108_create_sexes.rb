class CreateSexes < ActiveRecord::Migration
  def self.up
    create_table :sexes do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :sexes
  end
end
