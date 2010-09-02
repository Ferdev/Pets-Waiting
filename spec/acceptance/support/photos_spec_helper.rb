module PhotosSpecHelper
  Rspec.configure do |config|
    config.after(:each) do
      # clean disk of uploaded photos
      Photo.all.each { |photo| photo.destroy }
    end
  end
end