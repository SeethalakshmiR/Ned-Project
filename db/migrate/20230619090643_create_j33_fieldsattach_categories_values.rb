class CreateJ33FieldsattachCategoriesValues < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_fieldsattach_categories_values do |t|
      t.references :cat, foreign_key: { to_table: :j33_categories}, null: false
      t.references :fields, foreign_key: { to_table: :j33_fields}, null: false
      t.text :value, null: false
      t.string  :token, null: false, limit: 50
      t.timestamps
    end
  end
end