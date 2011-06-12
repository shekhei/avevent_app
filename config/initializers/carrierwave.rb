CarrierWave.configure do |config|
  config.root = Rails.root.join('tmp') # adding these...
  config.cache_dir = 'carrierwave'
    
  config.s3_access_key_id = "AKIAJZONZRQEHDH5BBEQ"
  config.s3_secret_access_key = "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"
  config.s3_bucket = "avevent"
  config.s3_region = 'ap-southeast-1'
end