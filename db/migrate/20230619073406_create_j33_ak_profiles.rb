class CreateJ33AkProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_ak_profiles do |t|
      t.string :description, null: false, limit: 255
      t.text :configuration, limit: 4294967295
      t.text :filters, limit: 4294967295
      t.integer :quickicon,:limit => 1 ,null: false, default: true
      t.string :token, limit: 50 ,default: nil
      t.timestamps
    end
  end
end
