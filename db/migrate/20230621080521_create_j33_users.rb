# frozen_string_literal: true

class CreateJ33Users < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_users do |t|
      # t.string :name, null: false, default: nil, limit: 400, index: {name: 'idx_name', length: 100}
      t.string :username, null: false, default: nil, limit: 190, index: {unique: true, name: 'idx_username'}
      t.string :email, null: false, default: nil, limit: 100, index: {name: 'email'}
      t.string :encrypted_password, null: false, default: nil, limit: 100
      t.string :secret_key
      t.integer :role, null: false, default: 0
      # t.boolean :block, null: false, default: 0, index: {name: 'idx_block'}
      # t.boolean :sendEmail, default: 0
      # t.datetime :registerDate, null: false
      # t.datetime :lastvisitDate, null: false
      # t.string :activation, null: false, default: nil, limit: 100
      # t.text :params, null: false, limit: 16777215 
      # t.datetime :lastResetTime, null: false, comment: 'Date of last password reset'
      # t.integer :resetCount, null: false, default: 0, comment: 'Count of password resets since lastResetTime'
      # t.string :otpKey, null: false, default: nil, comment: 'Two factor authentication encrypted keys', limit: 1000
      # t.string :otep, null: false, default: nil, comment: 'One time emergency passwords', limit: 1000
      # t.boolean :requireReset, null: false, default: 0, comment: 'Require user to reset password on next login'
      # t.string :authProvider, null: false, default: nil, comment: 'Name of used authentication plugin', limit: 100
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.string :token, limit: 50, default: nil


      t.timestamps null: false
    end

    # add_index :j33_users, :email,                unique: true
    # add_index :j33_users, :reset_password_token, unique: true
  end
end
