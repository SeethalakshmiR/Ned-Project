class CreateJ33ContentFrontpage < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_content_frontpages do |t|
     t.references :content, foreign_key: { to_table: :j33_contents }, null: false, default: 0, index: {unique:true}
     t.integer :ordering, null: false, default: 0
     t.string :token, limit: 50, default: nil
     t.timestamps
   end
 end
end