class CreateJ33CorejoomlaRating < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_corejoomla_ratings do |t|
      t.integer :item_id, unsigned: true, null: false
      t.references :asset, foreign_key: { to_table: :j33_assets }, null: false
      t.integer :total_ratings, unsigned: true, null: false, default: 0
      t.integer :sum_rating, unsigned: true, null: false, default: 0
      t.decimal :rating, precision: 4, scale: 2, null: false, default: 0.00
      t.string :token, limit: 50, default: nil
      t.timestamps
      end
    add_index(:j33_corejoomla_ratings, [:item_id, :asset_id], unique: true)
  end
end
