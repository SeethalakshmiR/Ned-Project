class CreateJ33UserUsergroupMap < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_user_usergroup_maps do |t|
      t.references  :user, foreign_key: { to_table: :j33_users }, null: false, default: 0, comment: 'Foreign Key to jos_users.id'
      t.references  :group, foreign_key: { to_table: :j33_usergroups }, null: false, default: 0, comment: 'Foreign Key to jos_usergroups.id'
      t.string :token, limit: 50, default: nil
      t.timestamps
    end
    add_index :j33_user_usergroup_maps, [:user_id, :group_id], unique: true
  end
end
