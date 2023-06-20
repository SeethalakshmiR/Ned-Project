class CreateJ33CorejoomlaMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_corejoomla_messages do |t|
     t.references :asset, foreign_key: { to_table: :j33_assets }, null: false
     t.string :asset_name, limit: 64, null: false 
     t.string :subject, limit: 255, null: false 
     t.text :description, limit: 16777215, null: false 
     t.string :params, limit: 999, default: nil
     t.datetime :created, null: false
     t.string :token, limit: 50, default: nil
     t.timestamps
   end
 end
end