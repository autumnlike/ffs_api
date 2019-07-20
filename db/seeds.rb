# Settingsはキャッシュされがち
Settings.reload!

# FFS マスタ登録
Settings.ffs.each do |config|
  # すでに設定済みなら更新
  ffs = FFS.find_or_initialize_by label: config.label
  ffs.update_attributes config.to_h
end
