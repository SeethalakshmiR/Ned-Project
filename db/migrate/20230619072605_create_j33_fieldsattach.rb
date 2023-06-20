class CreateJ33Fieldsattach < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_fieldsattaches do |t|
      t.string      :title, null: false, limit: 200
      t.text        :extras, null: false
      t.integer     :showtitle, limit: 1, null: false
      t.boolean     :positionarticle, limit: 1, default: 0
      t.string      :type, null: false, limit: 20
      t.integer     :groupid, null: true
      t.string      :articlesid, null: true
      t.string      :language, null: false, limit: 20
      t.boolean     :visible, limit: 1, null: false
      t.integer     :ordering, null: false
      t.boolean     :published, limit: 1, null: false
      t.boolean     :required, limit: 1, null: true
      t.boolean     :searchable, limit: 1, null: true
      t.text        :params, null: false
      t.string     :token, null: false, limit: 50
      t.timestamps
    end
  end
end
