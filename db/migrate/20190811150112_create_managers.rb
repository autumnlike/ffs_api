class CreateManagers < ActiveRecord::Migration[5.2]
  def change
    create_table :managers do |t|
      t.string :email

      t.timestamps
    end
    add_index :managers, :email, :unique => true
  end
end
