CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider              => 'AWS',
    :region                => ENV['S3_REGION'],
    :aws_access_key_id     => ENV['S3_ACCESS_KEY'],
    :aws_secret_access_key => ENV['S3_SECRET_KEY'],
  }
  config.fog_directory     =  ENV['S3_BUCKET']

  unless Rails.env.production?
    config.fog_credentials.merge!(
      {
        # [app -> localstack] コンテナ間の通信用に設定 ( http://localstack:4566 )
        :endpoint          => ENV['S3_ENDPOINT'],

        # デフォルトだと S3_BUCKET がサブドメインとなり接続できないため true に設定
        :path_style        => true,
      }
    )

    # endpoint がコンテナ間の通信用であるため、ホスト側から画像にアクセスするための URL ( http://localhost:4566 )
    config.asset_host = "#{ENV['S3_ASSET_HOST']}/#{ENV['S3_BUCKET']}"
  end
end