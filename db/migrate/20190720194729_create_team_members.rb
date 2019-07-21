class CreateTeamMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :team_members do |t|
      t.integer :team_id, null: false
      t.integer :member_id, null: false

      t.timestamps
    end
    add_index :team_members, :team_id
    add_index :team_members, :member_id
    add_index :team_members, [:team_id, :member_id], unique: true
  end
end
