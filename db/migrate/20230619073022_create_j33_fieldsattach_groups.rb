class CreateJ33FieldsattachGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_fieldsattach_groups do |t|
      t.string      :title, null: false
      t.string      :note, default: nil, limit: 150
      t.integer     :access, default: nil
      t.text        :description
      t.string      :position, default: nil
      t.integer     :group_for, default: nil
      t.integer     :showtitle, limit: 1, null: false
      t.string      :catid, null: false, limit: 100
      t.string      :articlesid, default: nil
      t.integer     :recursive, limit: 1, null: false
      t.string      :language, null: false, limit: 7
      t.integer     :ordering, null: false
      t.boolean     :published, limit: 1, null: false
      t.string     :token, null: false, limit: 50
      t.timestamps
    end
  end
end
