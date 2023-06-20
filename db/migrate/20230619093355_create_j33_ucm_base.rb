class CreateJ33UcmBase < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_ucm_bases do |t|
      t.integer :ucm_id, unsigned: true, null: false, index: {name: 'idx_ucm_id', unique: true}
      t.integer :ucm_item_id, null: false, index: {name: 'idx_ucm_item_id'} 
      t.integer :ucm_type_id, null: false, index: {name: 'idx_ucm_type_id'} 
      t.references :ucm_language, null: false, index: {name: 'idx_ucm_language_id'}
      t.string :token, limit: 50, default: nil
      t.timestamps
    end
  end
end
