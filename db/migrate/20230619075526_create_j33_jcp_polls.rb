class CreateJ33JcpPolls < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_jcp_polls do |t|
      t.references :asset, foreign_key: { to_table: :j33_assets}, null: false, default: 0
      t.string :title, null: false
      t.string :alias, null: false
      t.text :description
      t.text :end_message, limit: 16777215      
      t.references :cat, foreign_key: {to_table: :j33_categories}, null: false, default: 0, index: { name: 'idx_jcp_polls_catid' }
      t.integer :votes, unsigned: true, null: false, default: 0
      t.integer :voters, unsigned: true, null: false, default: 0
      t.datetime :created, null: false
      t.integer :created_by, unsigned: true, null: false, index:{name: 'idx_polls_created_by'}
      t.string :created_by_alias
      t.boolean :published, index:{name: 'idx_jcp_polls_published'}
      t.datetime :publish_up, null: false
      t.datetime :publish_down, null: false
      t.datetime :last_voted
      t.integer :checked_out, unsigned: true, null: false, default: 0, index:{name: 'idx_jcp_polls_checkout'}
      t.datetime :checked_out_time, null: false
      t.boolean :featured, unsigned: true, null: false, default: 0
      t.datetime :close_date
      t.datetime :results_up, null: false
      t.string :ip_address, limit: 39
      t.string :type, limit: 10, null: false, default: 'radio'
      t.integer :anywhere, limit: 1, default: 0
      t.integer :custom_answer, limit: 1, unsigned: true, null: false, default: 0
      t.string :chart_type, limit: 10, null: false, default: 'global'
      t.string :pallete, limit: 10, null: false, default: 'default'
      t.integer :anonymous, limit: 1, unsigned: true, null: false, default: 0
      t.integer :private, limit: 1, unsigned: true, null: false, default: 0
      t.string :secret, limit: 16
      t.string :answers_order, limit: 8, null: false, default: 'order'
      t.integer :min_answers, unsigned: true, null: false, default: 1
      t.integer :max_answers, unsigned: true, null: false, default: 0
      t.integer :modify_answers, limit: 1, unsigned: true, null: false, default: 0
      t.datetime :modified, null: false
      t.integer :modified_by, unsigned: true, null: false, default: 0
      t.string :language, limit:6, null: false, default: '*', index:{name: 'idx_jcp_polls_language'}
      t.integer :version, unsigned: true, null: false, default: 0
      t.string :attribs, limit:5120, default: nil
      t.integer :access, unsigned: true, null: false, default: 0, index:{name: 'idx_jcp_polls_access'}
      t.integer :ordering, unsigned: true, null: false, default: 0
      t.text :metakey
      t.text :metadesc
      t.text :metadata
      t.string :token, limit: 50, default: nil

      t.timestamps
    end
  end
end
