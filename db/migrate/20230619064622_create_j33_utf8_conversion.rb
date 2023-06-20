class CreateJ33Utf8Conversion < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_utf8_conversions do |t|
      t.integer :converted, null: false, default: 0, limit: 1
      t.string :token, limit: 50, default: nil
      t.timestamps
    end
  end
end
