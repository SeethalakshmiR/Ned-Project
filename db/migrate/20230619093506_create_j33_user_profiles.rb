class CreateJ33UserProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_user_profiles do |t|
      t.references  :user,  foreign_key: { to_table: :j33_users }, null: false
      t.string :profile_key, null: false, limit: 100
      t.text :profile_value, null: false
      t.integer :ordering, null: false, default: 0
      t.string :token, limit: 50, default: nil
      t.timestamps
    end
    add_index :j33_user_profiles, [:user_id, :profile_key], unique: true, name: 'idx_user_id_profile_key'
  end
end
