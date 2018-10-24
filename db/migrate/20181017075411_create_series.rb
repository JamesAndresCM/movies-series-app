class CreateSeries < ActiveRecord::Migration[5.2]
  def change
    create_table :series do |t|
      t.string :name
      t.string :img
      t.date :release_date
      t.string :description
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
