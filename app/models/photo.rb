class Photo < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  
  before_destroy :remove_image!
  
  belongs_to :pet
  
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
end
