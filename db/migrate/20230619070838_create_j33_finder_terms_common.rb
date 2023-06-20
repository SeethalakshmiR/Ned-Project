class CreateJ33FinderTermsCommon < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_finder_terms_commons do |t|
      t.string :term, null: false, limit: 75
      t.string :language, null: false, limit: 3, index: {name: 'idx_lang'}
      t.string :token, limit: 50, default: nil

      t.timestamps
    end
    add_index(:j33_finder_terms_commons, [:term, :language], :name => 'idx_word_lang')
    
  end
end
