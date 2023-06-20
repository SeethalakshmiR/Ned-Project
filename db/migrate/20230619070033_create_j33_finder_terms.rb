class CreateJ33FinderTerms < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_finder_terms do |t|
      t.integer :term_id, unsigned: true, null: false, index: { unique: true }
      t.string :term, null: false, limit: 75, index: { unique: true, name: 'idx_term'}
      t.string :stem, null: false, limit: 75
      t.integer :common, unsigned: true, null: false, default: 0, limit: 1
      t.integer :phrase, unsigned: true, null: false, default: 0, limit: 1
      t.float :weight, unsigned: true, null: false, default: 0
      t.string :soundex, null: false, limit: 75
      t.integer :links, null: false, default: 0
      t.string :language, null: false, default: nil, limit: 3
      t.string :token, limit: 50, default: nil 

      t.timestamps
    end
    add_index(:j33_finder_terms, [:term, :phrase], :name => 'idx_term_phrase')
    add_index(:j33_finder_terms, [:stem, :phrase], :name => 'idx_stem_phrase')
    add_index(:j33_finder_terms, [:soundex, :phrase], :name => 'idx_soundex_phrase')   
   
  end
end
