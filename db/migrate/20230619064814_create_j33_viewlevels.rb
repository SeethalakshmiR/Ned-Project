class CreateJ33Viewlevels < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_viewlevels do |t|
      t.string :title, null: false, default: nil, limit: 100, index: {unique: true, name: 'idx_assetgroup_title_lookup'}
      t.integer :ordering, null: false, default: 0     
      t.string :rules, null: false, comment: 'JSON encoded access control.', limit: 5120
      t.string :token, limit: 50, default: nil
      t.timestamps
    end
  end
end
