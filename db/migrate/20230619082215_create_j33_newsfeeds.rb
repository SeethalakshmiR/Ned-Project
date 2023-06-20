class CreateJ33Newsfeeds < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_newsfeeds do |t|
      t.references  :cat, foreign_key: { to_table: :j33_categories }, null: false, default: 0, index: {name: 'idx_catid'}
      t.string      :name, null: false, limit: 100, default: nil 
      t.string      :alias, null: false, limit: 400, default: nil
      t.string      :link, null: false, limit: 2048
      t.integer     :published, null: false, default: 0, index: {name: 'idx_state'}, limit: 1
      t.integer     :numarticles, null: false, default: 1, unsigned: true
      t.integer     :cache_time, null: false, default: 3600,  unsigned: true
      t.integer     :checked_out, null: false, default: 0, index: {name: 'idx_checkout'},  unsigned: true
      t.datetime    :checked_out_time, null: false
      t.integer     :ordering, null: false, default: 0
      t.boolean     :rtl, null: false, default: 0
      t.integer     :access, null: false, default: 0, unsigned: true, index: {name: 'idx_access'}
      t.string      :language, null: false, limit: 7, default: nil, index: {name: 'idx_language'}
      t.text        :params, limit: 16777215, null: false
      t.datetime    :created, null: false
      t.integer     :created_by, null: false, unsigned: true, default: 0, index: {name: 'idx_createdby'}
      t.string      :created_by_alias, null: false, default: nil
      t.datetime    :modified, null: false
      t.integer     :modified_by, null: false, unsigned: true, default: 0
      t.text        :metakey, limit: 16777215, null: false
      t.text        :metadesc, limit: 16777215, null: false
      t.text        :metadata, limit: 16777215, null: false
      t.string      :xreference, null: false, limit: 50, default: nil, index: {name: 'idx_xreference'}
      t.datetime    :publish_up, null: false
      t.datetime    :publish_down, null: false
      t.text        :description, limit: 16777215, null: false
      t.integer     :version, unsigned: true, null: false, default: 1
      t.integer     :hits, unsigned: true, null: false, default: 0
      t.text        :images, limit: 16777215, null: false
      t.string :token, limit: 50, default: nil
      t.timestamps
    end
  end
end
