class CreateJ33FieldsGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_fields_groups do |t|
      t.references :asset, foreign_key: { to_table: :j33_assets}, null: false, default: 0
      t.string :context, limit: 255, null: false, default: nil, index: {name: 'idx_context', length: 191} 
      t.string :title, limit: 255, null: false, default: nil
      t.string :note, limit: 255, null: false, default: nil
      t.text :description, null: false
      t.boolean :state, null: false, default: false, index: {name: 'idx_state'} 
      t.integer :checked_out, null: false, default: 0, index: {name: 'idx_checkout'} 
      t.datetime :checked_out_time, null: false
      t.integer :ordering, null: false, default: 0
      t.text :params, null: false
      t.string :language, limit: 7, null: false, default: nil, index: {name: 'idx_language'} 
      t.datetime :created, null: false, index: {name: 'idx_created_by'} 
      t.integer :created_by, unsigned: true, null: false, default: 0
      t.datetime :modified, null: false
      t.integer :modified_by, unsigned: true, null: false, default: 0
      t.integer :access, null: false, default: 1, index: {name: 'idx_access'} 

      t.timestamps
    end
  end
end
