class CreateJ33MijosqlQueries < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_mijosql_queries do |t|
      t.string    :title, null: false, default: nil
      t.text      :query, null: false
      t.string :token, limit: 50, default: nil 
      t.timestamps
    end
  end
end
