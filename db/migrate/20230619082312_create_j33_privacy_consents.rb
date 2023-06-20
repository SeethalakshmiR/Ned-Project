class CreateJ33PrivacyConsents < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_privacy_consents do |t|
      t.references  :user,  foreign_key: { to_table: :j33_users }, null: false, index: {name: 'idx_user_id'}
      t.integer :state, null: false, default: 1
      t.datetime :created, null: false
      t.string :subject, null: false, limit: 255, default: nil
      t.text :body, null: false
      t.integer :remind, null: false, default: 0, limit: 1
      t.string :token, null: false, limit: 100, default: nil
      t.timestamps
    end
  end
end
