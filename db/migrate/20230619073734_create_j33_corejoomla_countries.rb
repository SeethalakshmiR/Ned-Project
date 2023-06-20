class CreateJ33CorejoomlaCountries < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_corejoomla_countries do |t|
      t.string :country_code, limit: 3, null: false
      t.string :country_name, limit: 64, null: false
      t.string :language, limit: 6, null: false, default: '*'
      t.string :token, limit: 50, default: nil
      t.timestamps
    end
    add_index(:j33_corejoomla_countries, [:country_code, :language], :name => 'idx_corejoomla_countries_uniq', unique: true)
    
  end
end
