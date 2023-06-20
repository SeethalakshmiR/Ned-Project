class CreateJ33FinderLinksTermsc < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_finder_links_termscs do |t|
      t.references :link, foreign_key: { to_table: :j33_finder_links}, null: false
      t.references :term, foreign_key: { to_table: :j33_finder_terms}, null: false
      t.float :weight, unsigned: true, null: false
      t.string :token, limit: 50, default: nil

      t.timestamps
    end
    add_index(:j33_finder_links_termscs, [:link_id , :term_id], unique: true)
    add_index(:j33_finder_links_termscs, [:term_id , :weight], name: 'idx_term_weight')
    add_index(:j33_finder_links_termscs, [:link_id , :term_id, :weight], name: 'idx_link_term_weight')
  end
end
