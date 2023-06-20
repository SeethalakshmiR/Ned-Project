class CreateJ33FieldsattachValues < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_fieldsattach_values do |t|
      t.integer :articleid, null: false 
      t.references :fields, foreign_key: { to_table: :j33_fields}, null: false
      t.text :value, null: false, limit: 16777215
      t.string :token, limit: 50, default: nil 
      t.timestamps
    end
  end
end