class CreateJ33Overrider < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_overriders do |t|
      t.string :constant, null: false, limit: 255
      t.text :string, null: false, limit: 16777215
      t.string :file, null: false, limit: 255
      t.string :token, limit: 50 ,default: nil
      t.timestamps
    end
  end
end
