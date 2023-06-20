class CreateJ33TemplateStyles < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_template_styles do |t|
      t.string :template, null: false, default: nil, limit: 50, index: {name: 'idx_template'}
      t.integer :client_id, unsigned: true, null: false, default: 0, limit: 1, index: {name: 'idx_client_id'}
      t.string :home, null: false, default: 0, limit: 7
      t.string :title, null: false, default: nil
      t.text :params, null: false,  limit: 16777215
      t.integer :inheritable, null: false, default: 0, limit: 1
      t.string :parent, limit: 50, default: nil
      t.string :token, limit: 50, default: nil
      t.timestamps
    end
    add_index(:j33_template_styles, [:client_id, :home], :name => 'idx_client_id_home')
  end
end
