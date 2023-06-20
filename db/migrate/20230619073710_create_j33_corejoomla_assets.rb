class CreateJ33CorejoomlaAssets < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_corejoomla_assets do |t|
      t.string :name, limit: 64, null: false
      t.string :version, limit: 32, null: false
      t.date :released, null: false
      t.string :token, limit: 50, default: nil
      t.timestamps
    end
  end
end
