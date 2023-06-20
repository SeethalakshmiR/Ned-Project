class CreateJ33ExampleItems < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_example_items do |t|
      t.string :token, limit: 50 ,default: nil
      t.timestamps
    end
  end
end
