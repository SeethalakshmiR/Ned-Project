class CreateJ33GadDash < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_gad_dashes do |t|
      t.string :token, limit: 255 , null: false
      t.timestamps
    end
  end
end
