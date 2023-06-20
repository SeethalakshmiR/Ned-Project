class CreateJ33Assets < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_assets do |t|
      t.integer :parent_id, null: false, default: 0, comment: 'Nested set parent.', index: {name: 'idx_parent_id'} 
      t.integer :lft, null: false, default: 0, comment: 'Nested set lft.' 
      t.integer :rgt, null: false, default: 0, comment: 'Nested set rgt.'  
      t.integer :level, null: false, unsigned: true, comment: 'The cached level in the nested tree.'
      t.string :name, null: false, limit: 50, comment: 'The unique name for the asset.\n', index: {unique: 'true', name: 'idx_asset_name'} 
      t.string :title, null: false, limit: 100, comment: 'The descriptive title for the asset.'
      t.string :rules, null: false, limit: 5120, comment: 'JSON encoded access control.'
      t.string :token, limit: 50, default: nil
      t.timestamps
    end
    add_index(:j33_assets, [:lft, :rgt], :name => 'idx_lft_rgt')
  end
end
