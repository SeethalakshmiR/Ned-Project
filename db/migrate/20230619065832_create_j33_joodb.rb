class CreateJ33Joodb < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_joodbs do |t|
      t.string :name, limit: 125, null: false
      t.string :table, null: false
      t.text :tpl_list, null: false 
      t.text :tpl_single, null: false 
      t.text :tpl_print 
      t.text :tpl_form 
      t.string :fid, null: false
      t.string :ftitle, null: false
      t.string :fcontent, null: false
      t.string :fabstract, default: nil
      t.string :fdate, default: nil
      t.string :fstate, default: nil
      t.text :params 
      t.boolean :published, null: false, default: 1
      t.timestamp :created, null: false, default: -> { 'CURRENT_TIMESTAMP'}
      t.string :token, limit: 50, default: nil
      t.timestamps
    end
  end
end
