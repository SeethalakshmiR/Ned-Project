class CreateJ33PrivacyRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_privacy_requests do |t|
      t.string :email, null: false, limit: 100, default: nil
      t.datetime :requested_at, null: false
      t.integer :status, :limit => 1 , null: false, default: 0
      t.string :request_type, null: false, limit: 25, default: nil
      t.string :confirm_token, null: false, limit: 100, default: nil
      t.datetime :confirm_token_created_at, null: false
      t.string :token, limit: 50, default: nil
      t.timestamps
    end
  end
end
