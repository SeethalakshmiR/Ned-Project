class CreateJ33RedirectLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_redirect_links do |t|
      t.string :old_url, null: false, limit: 2048, index: {name: 'idx_old_url', length:100} 
      t.string :new_url, limit: 2048
      t.string :referer, null: false, limit: 2048
      t.string :comment, null: false, limit: 255, default: nil
      t.integer :hits, null: false, unsigned: true, default: 0
      t.integer :published, :limit => 1 , null: false
      t.datetime :created_date, null: false
      t.datetime :modified_date, null: false, index: {name: 'idx_link_modifed'} 
      t.integer :header, :limit => 2, null: false, default: 301
      t.string :token, limit: 50, default: nil
      t.timestamps
    end
  end
end
