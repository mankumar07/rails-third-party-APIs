class CreateRepositories < ActiveRecord::Migration[7.0]
  def change
    create_table :repositories do |t|
      t.string :repository_name
      t.integer :stargazers_count
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
