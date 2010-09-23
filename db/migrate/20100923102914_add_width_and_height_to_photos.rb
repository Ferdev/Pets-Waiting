class AddWidthAndHeightToPhotos < ActiveRecord::Migration
  def self.up
    add_column :photos, :width, :integer
    add_column :photos, :height, :integer
  end

  def self.down
    remove_column :photos, :width
    remove_column :photos, :height
  end
end
