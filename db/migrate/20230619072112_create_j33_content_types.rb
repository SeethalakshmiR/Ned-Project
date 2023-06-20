class CreateJ33ContentTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_content_types do |t|
      t.integer :type_id, unsigned: true, null: false, index: { unique: true }
      t.string :type_title, null: false, default: nil, limit: 255
      t.string :type_alias, null: false, limit: 400, index: {name: 'idx_alias', length:100 }, default: nil
      t.string :table, null: false, default: nil, limit: 255
      t.text :rules, limit: 16777215, null: false
      t.text :field_mappings, limit: 16777215, null: false
      t.string :router, null: false, default: nil, limit: 255
      t.string :content_history_options, limit: 5120, comment: 'JSON string for com_contenthistory options', default: nil
      t.string :token, limit: 50, default: nil
      t.timestamps
    end
  end
end
