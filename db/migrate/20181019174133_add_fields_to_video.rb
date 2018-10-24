class AddFieldsToVideo < ActiveRecord::Migration[5.2]
  def change
    add_column :videos, :duration, :string
    add_index :videos, :duration
    add_column :videos, :resolution, :string
    add_index :videos, :resolution
  end
end
