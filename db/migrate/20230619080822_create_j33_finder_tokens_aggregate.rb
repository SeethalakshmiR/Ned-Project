class CreateJ33FinderTokensAggregate < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_finder_tokens_aggregates do |t|
t.references :term, foreign_key: { to_table: :j33_finder_terms}, null: false, index: {name: 'keyword_id' }
t.string      :map_suffix, null: false, limit: 1
t.string      :term, null: false, limit: 75, index: { name: 'token'}
t.string      :stem, null: false, limit: 75
t.integer     :common, null: false, default: 0, unsigned: true, limit: 1
t.integer     :phrase, null: false, default: 0, unsigned: true, limit: 1
t.float       :term_weight, null: false, unsigned: true
t.integer     :context, null: false, default: 2, unsigned: true, limit: 1
t.float       :context_weight, null: false, unsigned: true
t.float       :total_weight, null: false, unsigned: true
t.string      :language, null: false, default: nil, limit: 3
t.string      :token, null: false, limit: 50, default: nil
t.timestamps
    end
  end
end
