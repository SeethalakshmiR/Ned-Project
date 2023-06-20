class CreateJ33FieldsCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_fields_categories do |t|
     t.references :field, foreign_key: { to_table: :j33_fields}, null: false, default: 0 
     t.references :category, foreign_key: { to_table: :j33_categories}, null: false, default: 0 
     t.string :token, limit: 50, default: nil 
     t.timestamps
   end 
     add_index(:j33_fields_categories, [:field_id, :category_id], unique: true)     
 end
end
