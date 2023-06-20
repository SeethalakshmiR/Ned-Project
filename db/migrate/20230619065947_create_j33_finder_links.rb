class CreateJ33FinderLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_finder_links do |t|
      t.integer :link_id, unsigned: true, null: false,  autoincrement: true, index: { unique: true }
      t.string :url, null: false, limit: 255, index: { name: 'idx_url', length: 75 }
      t.string :route, null: false, limit: 255
      t.string :title, limit: 400, default: nil, index: { name: 'idx_title', length: 100 }
      t.text :description
      t.datetime :indexdate, null: false 
      t.string :md5sum, limit: 32, default: nil, index: { name: 'idx_md5'}
      t.boolean :published, null: false, default: 1
      t.integer :state, default: 1 
      t.integer :access, default: 0 
      t.string :language, null: false, limit: 8 
      t.datetime :publish_start_date, null: false 
      t.datetime :publish_end_date, null: false
      t.datetime :start_date, null: false 
      t.datetime :end_date, null: false 
      t.string :list_price, null: false, default: '0'
      t.string :sale_price, null: false, default: '0'
      t.integer :type_id, null: false, index: { name: 'idx_type'}
      t.binary :object, null: false, :limit => 10.megabyte
      t.string :token, limit: 50, default: nil 

      t.timestamps
    end
    add_index(:j33_finder_links, [:published, :state, :access, :publish_start_date, :publish_end_date, :list_price], :name => 'idx_published_list')
    add_index(:j33_finder_links, [:published, :state, :access, :publish_start_date, :publish_end_date, :sale_price], :name => 'idx_published_sale')
   
  end
end
