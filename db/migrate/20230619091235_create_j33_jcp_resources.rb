class CreateJ33JcpResources < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_jcp_resources do |t|
      t.string :type, limit:255, null: false
      t.text :value, null: false
      t.references :poll, foreign_key: { to_table: :j33_jcp_polls}, null: false
      t.references :option, foreign_key: { to_table: :j33_jcp_options}, default: nil
      t.string :token, limit: 50, default: nil
      t.timestamps
    end
  end
end