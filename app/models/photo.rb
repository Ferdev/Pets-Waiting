# encoding: UTF-8
class Photo < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  attr_accessible :image

  before_destroy :remove_image!

  belongs_to :pet

  def has_thumbnail?
    image && image.thumb && !image.thumb.url.blank?
  end
end
