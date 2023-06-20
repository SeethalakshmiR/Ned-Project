class CreateJ33Associations < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_associations do |t|
      t.string :context, null: false, limit: 50, comment: 'The context of the associated item.', index: {unique: 'true',name: 'idx_context'}
      t.string :key, null: false, limit: 32, comment: 'The key for the association computed from an md5 on associated ids.', index: {name: 'idx_key'}
      t.string :token, limit: 50, default: nil
      t.timestamps
    end
  end
end
