class RenameUserToMember < ActiveRecord::Migration[5.2]
  def change
    rename_table :users, :members
    rename_table :user_ffs, :member_ffs
    rename_column :member_ffs, :user_id, :member_id
    rename_table :user_stresses, :member_stresses
    rename_column :member_stresses, :user_id, :member_id
  end
end
