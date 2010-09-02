class AddUploaderColumnToPhotos < ActiveRecord::Migration
  def self.up
    add_column :photos, :image, :string
  end

  def self.down
    remove_column :photos, :image
  end
end
