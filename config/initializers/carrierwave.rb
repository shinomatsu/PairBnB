CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['SECRET_ACCESS_KEY'],
    region: 'ap-southeast-1'#リージョンをUS以外にしたかたはそのリージョンに変更
  }
  config.fog_directory  = 'pairbnbtest'
end