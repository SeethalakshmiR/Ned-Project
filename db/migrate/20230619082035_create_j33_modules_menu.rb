class CreateJ33ModulesMenu < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_modules_menus do |t|
      t.references :module, foreign_key: { to_table: :j33_modules }, null: false, default: 0
      t.references :menu, foreign_key: { to_table: :j33_menus }, null: false, default: 0
      t.string :token, limit: 50, default: nil
      t.timestamps
    end
    add_index :j33_modules_menus, [:module_id, :menu_id], unique: true
  end
end
