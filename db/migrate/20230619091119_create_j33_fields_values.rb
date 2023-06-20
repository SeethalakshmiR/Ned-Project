class CreateJ33FieldsValues < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_fields_values do |t|
      t.references :field, foreign_key: { to_table: :j33_fields}, null: false, index:{name: 'idx_field_id'}
      t.string :item_id, null: false, limit: 255, comment: "Allow references to items which have strings as ids, eg. none db systems.", index:{name: 'idx_item_id', length: 191}
      t.text :value
      t.string :token, limit: 50 ,default: nil
      t.timestamps
    end
  end
end
