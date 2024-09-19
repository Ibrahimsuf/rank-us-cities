class CreateComparisons < ActiveRecord::Migration[7.0]
  def change
    create_table :comparisons do |t|
      t.references :winner, null: false, foreign_key: { to_table: :cities }
      t.references :loser, null: false, foreign_key: { to_table: :cities }
      t.timestamps
    end
  end
end
