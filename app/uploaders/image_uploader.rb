# encoding: utf-8
class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  if Rails.env.production? || Rails.env.staging?
    storage :fog
  else
    storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :resize_to_fit => [600, 1000]

  version :thumb do
    process :crop_image
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def crop_image
    if model.cropping?
      manipulate! do |img|
        img.crop!(model.crop_x.to_i, model.crop_y.to_i, model.crop_w.to_i, model.crop_h.to_i)
        img
      end
      model.update_attribute(:cropped, true)
    else
      resize_to_fill(200, 200)
      convert_image_to_black_and_white
    end
  end

  def convert_image_to_black_and_white
    manipulate! do |img|
      img.colorspace = Magick::GRAYColorspace
      img
    end
  end

  def dimensions
    unless model.width && model.height
      img = ::Magick::Image.read(current_path).first
      model.width  = img.columns
      model.height = img.rows
      model.save
    end
    "#{model.width}x#{model.height}" if model.width && model.height
  end

end
