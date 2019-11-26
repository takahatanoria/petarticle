require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.development? || Rails.env.test? #開発とテストで条件分岐
    config.storage = :file
    # config.storage = :fog

  elsif Rails.env.production? #本番はS3に保存
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {

  #AWSのアクセスキーとシークレットキーを環境変数で定義
    provider: 'AWS',
    aws_access_key_id: Rails.application.credentials.aws[:access_key_id],
    aws_secret_access_key: Rails.application.credentials.aws[:secret_access_key],
    secret_key_base: Rails.application.credentials.secret_key_base,
    region: 'ap-northeast-1' 
  }

  config.fog_directory  = 'takahatanoria'
  config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/takahatanoriapet'
 end
end