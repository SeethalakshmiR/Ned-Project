class CreateJ33PostinstallMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_postinstall_messages do |t|
      t.bigint :postinstall_message_id, unsigned: true, null: false, index: { unique: true }
      t.references :extension, foreign_key: { to_table: :j33_extensions }, null: false, default: 700, comment: 'FK to jos_extensions'
      t.string :title_key, null: false, default: nil, comment: 'Lang key for the title', limit: 255
      t.string :description_key, null: false, default: nil, comment: 'Lang key for description', limit: 255
      t.string :action_key, null: false, default: nil, limit: 255
      t.string :language_extension, null: false, default: 'com_postinstall', comment: 'Extension holding lang keys', limit: 255
      t.integer :language_client_id, null: false, default: 1, limit: 1
      t.string :type, null: false, default: 'link', comment: 'Message type - message, link, action', limit: 10
      t.string :action_file, default: nil, comment: 'RAD URI to the PHP file containing action method', limit: 255
      t.string :action, default: nil, comment: 'Action method name or URL', limit: 255
      t.string :condition_file, comment: 'RAD URI to file holding display condition method', limit: 255, default: nil
      t.string :condition_method, comment: 'Display condition method, must return boolean', limit: 255, default: nil
      t.string :version_introduced, null: false, default: '3.2.0', comment: 'Version when this message was introduced', limit: 50
      t.boolean :enabled, null: false, default: 1
      t.string :token, limit: 50, default: nil 
      t.timestamps
    end
  end
end
