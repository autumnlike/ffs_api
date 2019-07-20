class CreateTeamMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :team_members do |t|
      t.integer :member_id, null: false

      t.timestamps
    end
    add_index :team_members, :member_id
  end
end
