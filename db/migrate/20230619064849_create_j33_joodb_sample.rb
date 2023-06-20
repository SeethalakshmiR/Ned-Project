class CreateJ33JoodbSample < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_joodb_samples do |t|
      t.integer   :myid, null: false, index: { unique: true }
      t.string    :title, null: false, limit: 100, index: { name: 'title'}
      t.string    :value, default: nil, limit: 10
      t.string    :usefull, null: false, default: 'yes'
      t.string    :picture, default: nil, limit: 100
      t.text      :short_description
      t.text      :description, null: false
      t.string    :wikipedia, default: nil, limit: 254
      t.string    :category, null: false
      t.timestamp :date, null: false, default: -> { "CURRENT_TIMESTAMP" }
      t.integer   :state, null: false, default: 0, comment: "Table with joodb sample nosense data. Save to remove", index: { name: 'state'}, limit: 1
      t.string :token, limit: 50, default: nil 
      t.timestamps
    end
  end
end
