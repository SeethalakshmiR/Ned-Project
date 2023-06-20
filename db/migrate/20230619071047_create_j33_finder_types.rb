class CreateJ33FinderTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_finder_types do |t|
      t.string :title, null: false, limit: 100, index: {unique: 'true', name: 'title'} 
      t.string :mime, null: false, limit: 100
      t.string :token, limit: 50, default: nil
      t.timestamps
    end
  end
end
