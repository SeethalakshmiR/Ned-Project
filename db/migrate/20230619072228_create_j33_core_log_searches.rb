class CreateJ33CoreLogSearches < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_core_log_searches do |t|
      t.string :search_term, null: false, default: nil, limit: 128
      t.integer :hits, unsigned: true, null: false, default: 0
      t.string :token, limit: 50, default: nil
      t.timestamps
    end
  end
end
