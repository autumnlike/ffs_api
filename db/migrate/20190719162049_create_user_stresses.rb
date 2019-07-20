class CreateUserStresses < ActiveRecord::Migration[5.2]
  def change
    create_table :user_stresses do |t|
      t.integer :user_id
      t.integer :point, comment: 'ストレス値'
      t.date :diagnostic_at, comment: '診断日'
      t.timestamps
    end
  end
end
