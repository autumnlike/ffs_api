class CreateBaseTables < ActiveRecord::Migration[5.2]
  def change
    create_table :ffs, comment: 'FFS各因子詳細' do |t|
      t.string :label, comment: '記号'
      t.string :name, comment: '名前'
      t.string :overview, comment: '詳細'
      t.string :long_description, comment: '91タイプ分類が1因子だけの場合の長めの説明'
      t.string :short_description, comment: '91タイプ分類が2因子以上の場合の短めの説明'
      t.timestamps
    end
    create_table :users do |t|
      t.string :key, null: true, comment: '社員番号等のキー値'
      t.string :name, comment: '名前'
      t.string :name_en, comment: '英語名'
      t.string :email, comment: 'メールアドレス'
      t.timestamps
    end
    create_table :user_ffs do |t|
      t.integer :user_id
      t.integer :a, comment: '凝縮性'
      t.integer :b, comment: '受容性'
      t.integer :c, comment: '弁別性'
      t.integer :d, comment: '拡散性'
      t.integer :e, comment: '保全性'
      t.string :'4_type', comment: '4タイプ分類, Ex: TG, AN等'
      t.string :'91_type', comment: '91タイプ分類, Ex: ACB, BC, D等'
      t.timestamps
    end
  end
end
