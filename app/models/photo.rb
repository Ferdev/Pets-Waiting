class Photo < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  
  before_destroy :remove_image!
  after_update :crop_image
  
  belongs_to :pet
  
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  
  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end
  
  def crop_image
    image.thumb.crop_image
  end
end
