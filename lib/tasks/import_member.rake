# bundle exec rake import_member:by_ethos
namespace :import_member do
  desc "ETHOS から エクスポートしたCSVファイルからユーザー情報を読み込む"
  task :by_ethos => :environment do
    filepath = "#{Rails.root}/tmp/*.csv"
    files = Dir.glob filepath
    files.each do | file_name |
      EthosImporterService::import file_name
    end
  end
end
