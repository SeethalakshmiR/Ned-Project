class CreateJ33Menu < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_menus do |t|
      t.string :menutype, limit: 24, null: false, comment: 'The type of menu this item belongs to. FK to #__menu_types.menutype', index: { name: 'idx_menutype'}
      t.string :title, limit: 255, null: false, comment: 'The display title of the menu item.'
      t.string :alias, limit: 400, null: false, comment: 'The SEF alias of the menu item.',index: { name: 'idx_alias', length: 100 }
      t.string :note, limit: 255, null: false, default: nil
      t.string :path, limit: 1024, null: false, comment: 'The computed path of the menu item based on the alias field.', index: { name: 'idx_path', length: 100}
      t.string :link, limit: 1024, null: false, comment: 'The actual link the menu item refers to.'
      t.string :type, limit: 16, null: false, comment: 'The type of link: Component, URL, Alias, Separator'
      t.integer :published, limit: 1, null: false, default: false, comment: 'The published state of the menu link.'
      t.integer :parent_id, unsigned: true, null: false, default: 1, comment: 'The parent menu item in the menu tree.'
      t.integer :level, unsigned: true, null: false, default: 0, comment: 'The relative level in the tree.'
      t.integer :component_id, unsigned: true, null: false, default: 0, comment: 'FK to jos_extensions.id'
      t.integer :checked_out, unsigned: true, null: false, default: 0, comment: 'FK to jos_users.id'
      t.datetime :checked_out_time, null: false, comment: 'The time the menu item was checked out.'
      t.boolean :browserNav, null: false, default: false, comment: 'The click behavior of the link.'
      t.integer :access, unsigned: true, null: false, default: 0, comment: 'The access level required to view the menu item.'
      t.string :img, limit: 255, null: false, comment: 'The image of the menu item.'
      t.references :template_style, null: false, foreign_key: { to_table: :j33_template_styles}, default: 0
      t.text :params, null: false, limit: 16777215, comment: 'JSON encoded data for the menu item.'
      t.integer :lft, null: false, default: 0, comment: 'Nested set lft.'
      t.integer :rgt, null: false, default: 0, comment: 'Nested set rgt.'
      t.integer :home, limit: 1, unsigned: true, null: false, default: false, comment: 'Indicates if this menu item is the home or default page.'
      t.string :language, limit: 7, null: false, default: nil, index: { name: 'idx_language'}
      t.integer :client_id, limit: 1, null: false, default: false
      t.string :token, limit: 50, default: nil
      t.timestamps
    end
    add_index :j33_menus, [:client_id, :parent_id, :alias, :language], name: 'idx_client_id_parent_id_alias_language', unique: true, length: { alias: 100 }
    add_index :j33_menus, [:component_id, :menutype, :published, :access], name: 'idx_componentid'
    add_index :j33_menus, [:lft, :rgt], name: 'idx_left_right'
  end
end
