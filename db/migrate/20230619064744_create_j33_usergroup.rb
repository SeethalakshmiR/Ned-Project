class CreateJ33Usergroup < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_usergroups do |t|
      t.integer :parent_id, unsigned: true, null: false, default: 0, comment: 'Adjacency List Reference Id',  index: {name: 'idx_usergroup_adjacency_lookup'}
      t.integer :lft, null: false, default: 0, comment: 'Nested set lft.'
      t.integer :rgt, null: false, default: 0, comment: 'Nested set rgt.'
      t.string :title, null: false, default: nil, limit: 100, index: {name: 'idx_usergroup_title_lookup'}
      t.string :token, limit: 50, default: nil
      t.timestamps
    end
    add_index(:j33_usergroups, [:parent_id, :title],:unique => true, :name => 'idx_usergroup_parent_title_lookup')
    add_index(:j33_usergroups, [:lft, :rgt], :name => 'idx_usergroup_nested_set_lookup')
  end
end
