class CreateJ33Messages < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_messages do |t|
      t.integer     :message_id, unsigned: true, null: false, index: {unique: true}
      t.integer     :user_id_from, unsigned: true, null: false, default: 0
      t.integer     :user_id_to, unsigned: true, null: false, default: 0
      t.integer     :folder_id, limit: 1, unsigned: true, null: false, default: 0
      t.datetime    :date_time, null: false
      t.integer     :state, limit: 1, null: false, default: 0
      t.integer     :priority, unsigned: true, null: false, default: 0, limit: 1
      t.string      :subject, null: false, default: nil
      t.text        :message, limit: 16777215, null: false
      t.string      :token, null: false, limit: 50
      t.timestamps
    end
      add_index(:j33_messages, [:user_id_to, :state], :name => 'useridto_state')
  end
end
