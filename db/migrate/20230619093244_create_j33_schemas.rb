class CreateJ33Schemas < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_schemas do |t|
      t.references :extension, foreign_key: { to_table: :j33_extensions }, null: false
      t.string :version_id, null: false, limit: 20
      t.string :token, limit: 50, default: nil

      t.timestamps
    end
    add_index(:j33_schemas, [:extension_id, :version_id], unique: true, :name => 'idx_primary')
  end
end
