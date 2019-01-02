# bundle exec rake import_user_ffs:ethos_format
namespace :impoort_user_ffs do
  desc "ETHOS から エクスポートしたCSVファイルからユーザー情報を読み込む"
  task :by_ethos => :environment do
    filepath = "#{Rails.root}/tmp/*.csv"
    files = Dir.glob filepath
    files.each do | file_name |
      EthosImporterService::import file_name
    end
  end
end
