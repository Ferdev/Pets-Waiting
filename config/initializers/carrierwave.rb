CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => ENV['AWS_KEY'] || '',
    :aws_secret_access_key  => ENV['AWS_SECRET'] || '',
    :region                 => APP_CONFIG[:aws_region]
  }
  config.fog_host       = "https://s3.amazonaws.com/#{APP_CONFIG[:aws_bucket]}"
  config.fog_directory  = APP_CONFIG[:aws_bucket]
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
end