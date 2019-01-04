# Settingsはキャッシュされがち
Settings.reload!

# FFS マスタ登録
Settings.ffs.each do |config|
  # すでに設定済みなら更新
  ffs = FFS.find_or_initialize_by label: config.label
  ffs.update_attributes config.to_h
end

User.create(
  id: 1,
  key: 2,
  name: '秋好 太郎',
  name_en: 'Akiyoshi Taro',
  email: 'akiyoshi.taro@example.com',
)
UserFFS.create(
  user_id: 1,
  a: 6,
  b: 15,
  c: 9,
  d: 11,
  e: 11,
  "4_type": "ML",
  "91_type": "BED",
)
