class Photo < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  
  before_destroy :remove_image!
  
  belongs_to :pet
  
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  
  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end
  
  def has_thumbnail?
    image && image.thumb && !image.thumb.url.blank?
  end
  
  def crop_image
    image.recreate_versions!
  end
  
  def update_and_crop(attributes)
    update_attributes(attributes)
    crop_image
  end
end
