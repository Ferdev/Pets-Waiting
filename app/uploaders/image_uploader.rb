# encoding: utf-8
class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded
  #     def default_url
  #       "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  #     end

  process :resize_to_fit => [600, 1000]

  version :thumb do
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
    else
      resize_to_fit(400, 400)
    end
  end
end
