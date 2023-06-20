class CreateJ33Extensions < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_extensions do |t|
      t.integer :extension_id, null: false, index: { unique: true }
      t.integer :package_id, null: false, default: 0, comment: 'Parent package ID for extensions installed as a package.'
      t.string :name, null: false, limit: 100
      t.string :type, null: false, limit: 20
      t.string :element, null: false, limit: 100
      t.string :folder, null: false, limit: 100
      t.integer :client_id, null: false, limit: 1
      t.boolean :enabled, null: false, default: 0
      t.integer :access, unsigned: true, default: 1, null: false
      t.boolean :protected, null: false, default: 0
      t.text :manifest_cache, null: false, limit: 16777215 
      t.text :params, null: false, limit: 16777215 
      t.text :custom_data, null: false, limit: 16777215 
      t.text :system_data, null: false, limit: 16777215 
      t.integer :checked_out, unsigned: true, null: false, default: 0
      t.datetime :checked_out_time, null: false
      t.integer :ordering, default: 0 
      t.integer :state, default: 0 
      t.string :token, limit: 50, default: nil 
      t.timestamps
    end
    add_index(:j33_extensions, [:element, :client_id], :name => 'element_clientid')
    add_index(:j33_extensions, [:element, :folder, :client_id], :name => 'element_folder_clientid')
    add_index(:j33_extensions, [:type, :element, :folder, :client_id], :name => 'extension')
  end
end
