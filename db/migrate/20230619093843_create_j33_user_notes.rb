class CreateJ33UserNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_user_notes do |t|
      t.references :user, foreign_key: { to_table: :j33_users }, null: false, default: 0, index: {name: 'idx_user_id'}
      t.references :cat, foreign_key: { to_table: :j33_categories }, null: false, default: 0, index: {name: 'idx_category_id'}
      t.string :subject, null: false, limit: 100, default: nil
      t.text :body, limit: 16777215, null: false
      t.integer :state, limit: 1, null: false, default: 0
      t.integer :checked_out, unsigned: true, null: false, default: 0
      t.datetime :checked_out_time, null: false
      t.integer :created_user_id, unsigned: true, null: false, default: 0
      t.datetime :created_time, null: false
      t.integer :modified_user_id, unsigned: true, null: false
      t.datetime :modified_time, null: false
      t.datetime :review_time, null: false
      t.datetime :publish_up, null: false
      t.datetime :publish_down, null: false
      t.string :token, limit: 50, default: nil
      t.timestamps
    end
  end
end
