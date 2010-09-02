class AddCroppedToPhotos < ActiveRecord::Migration
  def self.up
    add_column :photos, :cropped, :boolean, :default => false
  end

  def self.down
    remove_column :photos, :cropped
  end
end
