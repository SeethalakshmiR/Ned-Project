class CreateJ33Fields < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_fields do |t|
      t.references :asset, foreign_key: { to_table: :j33_assets}, null: false, default: 0
      t.string :context, limit: 255, null: false, default: nil, index: { name: 'idx_context', length: 191 }
      t.integer :group_id, unsigned: true, null: false, default: 0
      t.string :title, limit: 255, null: false, default: nil
      t.string :name, limit: 255, null: false, default: nil
      t.string :label, limit: 255, null: false, default: nil
      t.text :default_value
      t.string :type, limit: 255, null: false, default: 'text'
      t.string :note, limit: 255, null: false, default: nil
      t.text :description, null: false
      t.integer :state, null: false, limit:1, default: false, index: { name: 'idx_state' }
      t.integer :required, null: false, limit:1, default: false
      t.integer :checked_out, null: false, default: 0, index: { name: 'idx_checkedout' }
      t.datetime :checked_out_time, null: false
      t.integer :ordering, null: false, default: 0
      t.text :params, null: false
      t.text :fieldparams, null: false
      t.string :language, limit: 7, null: false, default: nil, index: { name: 'idx_language' }
      t.datetime :created_time, null: false
      t.integer :created_user_id, unsigned: true, null: false, default: 0, index: { name: 'idx_created_user_id' }
      t.datetime :modified_time, null: false
      t.integer :modified_by, unsigned: true, null: false, default: 0
      t.integer :access, null: false, default: 1, index: { name: 'idx_access' }
      t.string :token, null: false, limit: 50, default: nil
      t.timestamps
    end
  end
end
