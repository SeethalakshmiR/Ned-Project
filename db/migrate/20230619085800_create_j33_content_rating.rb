class CreateJ33ContentRating < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_content_ratings do |t|
      t.references :content, foreign_key: { to_table: :j33_contents }, null: false, default: 0, index: {name: 'idx_PRIMARY'}, unique: true
      t.integer :rating_sum, unsigned: true, null: false, default: 0
      t.integer :rating_count, unsigned: true, null: false, default: 0
      t.string :lastip, limit: 50, null: false, default: nil
      t.string :token, limit: 50, default: nil 
      t.timestamps
    end
  end
end