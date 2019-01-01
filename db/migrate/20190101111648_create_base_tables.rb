class CreateBaseTables < ActiveRecord::Migration[5.2]
  def change
    create_table :ffs, comment: 'FFS各因子詳細' do |t|
      t.string :label, comment: '記号'
      t.string :name, comment: '名前'
      t.string :description, comment: '詳細'
      t.timestamps
    end
    create_table :ffs_type_infos, comment: '91Type 説明' do |t|
      t.string :type, comment: '91Type名, Ex: ACB, BC, D等'
      t.string :description, comment: 'タイプでの説明'
      t.timestamps
    end
    create_table :users do |t|
      t.integer :key, comment: '社員番号等のキー値'
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
      t.string :type, comment: '91types'
      t.timestamps
    end
  end
end
