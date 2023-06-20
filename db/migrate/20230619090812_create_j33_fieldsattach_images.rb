class CreateJ33FieldsattachImages < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_fieldsattach_images do |t|
      t.integer :articleid, null: false
      t.references :fieldsattach, null: false, foreign_key: {to_table: :j33_fieldsattaches}
      t.references :cat, foreign_key: {to_table: :j33_categories}
      t.string :title, null: false, limit: 255
      t.string :image1, null: false, limit: 255
      t.string :image2, null: false, limit: 255
      t.string :image3, null: false, limit: 255
      t.text :description, null: false
      t.integer :ordering, null: false
      t.boolean :published, null: false
      t.string :token, limit: 50, default: nil
      t.timestamps
    end
  end
end