class CreateJ33FinderFilters < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_finder_filters do |t|
      t.integer :filter_id, null: false, unsigned: true, index: {unique: true}
      t.string :title, null: false, limit: 255
      t.string :alias, null: false, limit: 255
      t.boolean :state, null: false, default: true
      t.datetime :created, null: false
      t.integer :created_by, null: false, unsigned: true
      t.string :created_by_alias, null: false, limit: 255
      t.datetime :modified, null: false
      t.integer :modified_by, null: false, default: 0, unsigned: true
      t.integer :checked_out, null: false, default: 0, unsigned: true
      t.datetime :checked_out_time, null: false
      t.integer :map_count, null: false, default: 0, unsigned: true
      t.text :data, null: false, limit: 16777215
      t.text :params, limit: 4294967295
      t.string :token, limit: 50 ,default: nil
      t.timestamps
    end
  end
end
