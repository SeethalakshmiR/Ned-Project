class CreateJ33CjlibConfig < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_cjlib_configs do |t|
      t.string :config_name, null: false, index: { unique: true}
      t.text :config_value, null: false
      t.string :token, limit: 50, default: nil
      t.timestamps
    end
  end
end
