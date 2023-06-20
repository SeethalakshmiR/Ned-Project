class CreateJ33JcpVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_jcp_votes do |t|
      t.references :poll, foreign_key: {to_table: :j33_jcp_polls}, null: false, index: { name: 'FK_JCP_VOTES' }
      t.integer :voter_id, unsigned: true, default: nil, index:{name: 'idx_jcp_votes_voter_id'}
      t.string :ip_address, limit:39, default: nil
      t.datetime :voted_on, null: false
      t.references :option, foreign_key: {to_table: :j33_jcp_options}, null: false, default: 0, index: { name: 'idx_jcp_votes_optionid' }
      t.integer :column_id, unsigned: true, null: false, default: 0
      t.text :custom_answer 
      t.string :token, limit: 50, default: nil
      
      t.timestamps
    end
  end
end
