class CreateJ33JcpCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_jcp_categories do |t|
      t.string :title, null: false, limit: 255
      t.string :alias, null: false, limit: 255
      t.boolean :published, unsigned: true, default: 0, null: false
      t.boolean :locked, unsigned: true, default: 0, null: false
      t.integer :parent_id, unsigned: true, null: false
      t.integer :num_polls, unsigned: true, default: 0, null: false
      t.integer :num_votes, unsigned: true, default: 0, null: false
      t.integer :nleft, unsigned: true, null: false
      t.integer :nright, unsigned: true, null: false
      t.integer :nlevel, unsigned: true, default: 0, null: false
      t.integer :norder, unsigned: true, default: 0, null: false
      t.string :language, null: false, limit: 6, default: '*'
      t.integer :migrated, unsigned: true, default: 0, null: false
  
      t.timestamps
    end
  end
end
