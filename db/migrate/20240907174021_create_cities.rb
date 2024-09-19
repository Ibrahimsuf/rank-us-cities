class CreateCities < ActiveRecord::Migration[7.0]
  def change
    create_table :cities do |t|
      t.string :name
      t.integer :wins
      t.integer :loses
      t.integer :elo
      t.timestamps
    end
  end
end
