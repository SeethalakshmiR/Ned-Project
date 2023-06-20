class CreateJ33ContactDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_contact_details do |t|
      t.string :name, null: false
      t.string :alias, null: false, limit: 400, default: nil
      t.string :con_position, default: nil
      t.text :address, limit: 16777215
      t.string :suburb, default: nil, limit: 100
      t.string :state, default: nil, limit: 100
      t.string :country, default: nil, limit: 100
      t.string :postcode, limit: 100, default: nil
      t.string :telephone, default: nil
      t.string :fax, default: nil
      t.text :misc, limit: 4294967295
      t.string :image, default: nil
      t.string :email_to, default: nil
      t.integer :default_con, limit: 1, unsigned: true, null: false, default: 0
      t.boolean :published, null: false, default: 0, index: {name: 'idx_state'}
      t.integer :checked_out, unsigned: true, null: false, default: 0, index: {name: 'idx_checkout'}
      t.datetime :checked_out_time, null: false
      t.integer :ordering, null: false, default: 0
      t.text :params, limit: 16777215, null: false
      t.references :user, foreign_key: { to_table: :j33_users }, null: false, default: 0
      t.references :cat, foreign_key: { to_table: :j33_categories }, null: false, default: 0, index: {name: 'idx_catid'}
      t.integer :access, unsigned: true, null: false, default: 0, index: {name: 'idx_access'}
      t.string :mobile, null: false, default: nil
      t.string :webpage, null: false, default: nil
      t.string :sortname1, null: false, default: nil
      t.string :sortname2, null: false, default: nil
      t.string :sortname3, null: false, default: nil
      t.string :language, null: false, limit: 7, index: {name: 'idx_language'}
      t.datetime :created, null: false
      t.integer :created_by, unsigned: true, null: false, default: 0, index: {name: 'idx_createdby'}
      t.string :created_by_alias, null: false, default: nil
      t.datetime :modified, null: false
      t.integer :modified_by, unsigned: true, null: false, default: 0
      t.text :metakey, limit: 16777215, null: false
      t.text :metadesc, limit: 16777215, null: false
      t.text :metadata, limit: 16777215, null: false
      t.boolean :featured, unsigned: true, null: false, default: 0, comment: 'Set if article is featured.'
      t.string :xreference, null: false, default: nil, limit: 50, index: {name: 'idx_xreference'}, comment: 'A reference to enable linkages to external data sets.'
      t.datetime :publish_up, null: false
      t.datetime :publish_down, null: false
      t.integer :version, unsigned: true, null: false, default: 1
      t.integer :hits, unsigned: true, null: false, default: 0
      t.string :token, limit: 50, default: nil
      t.timestamps
    end
      add_index(:j33_contact_details, [:featured, :cat_id], :name => 'idx_featured_catid')
  end
end