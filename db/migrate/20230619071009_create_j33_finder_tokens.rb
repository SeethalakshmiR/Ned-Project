class CreateJ33FinderTokens < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_finder_tokens do |t|
      t.string :term, null: false, limit: 75, index: {name: 'idx_word'}
      t.string :stem, null: false, limit: 75
      t.integer :common, unsigned: true, null: false, default: 0, limit: 1
      t.integer :phrase, unsigned: true, null: false, default: 0, limit: 1
      t.float :weight, unsigned: true, null: false, default: 1
      t.integer :context, unsigned: true, null: false, default: 2, limit: 1, index: {name: 'idx_context'}
      t.string :language, null: false, default: nil, limit: 3
      t.string :token, limit: 50, default: nil
      t.timestamps
    end
  end
end
