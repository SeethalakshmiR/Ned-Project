class CreateJ33GadDashCache < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_gad_dash_caches do |t|
      t.string :name, null: false, index: { unique: true, name: 'name'}
      t.text :data, null: false 
      t.integer :expire, null: false
      t.string :token, limit: 50, default: nil 

      t.timestamps
    end
  end
end
