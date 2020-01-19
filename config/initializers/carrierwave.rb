require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.test? || Rails.env.development?
    config.storage = :file
  elsif Rails.env.production?
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     Rails.application.credentials.aws[:access_key_id],
      aws_secret_access_key: Rails.application.credentials.aws[:secret_access_key],
      region:                'ap-northeast-1'
    }
    config.fog_directory  = 'freemarket-sample-59wa'
    config.asset_host = 'https://freemarket-sample-59wa.s3.ap-northeast-1.amazonaws.com/'
  end
end

CarrierWave::SanitizedFile.sanitize_regexp = /[^[:print:]]/ #ファイル名の文字化け防止
