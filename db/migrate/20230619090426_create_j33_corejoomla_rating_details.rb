class CreateJ33CorejoomlaRatingDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_corejoomla_rating_details do |t|
     t.references :asset, foreign_key: { to_table: :j33_assets }, null: false
     t.integer :item_id, unsigned: true, null: false
     t.integer :action_id, unsigned: true, null: false, default: 0
     t.integer :rating, unsigned: true, null: false
     t.integer :created_by, unsigned: true, null: false, default: 0
     t.datetime :created,  null: false
     t.string :token, limit: 50, default: nil
     t.timestamps
   end
 end
end