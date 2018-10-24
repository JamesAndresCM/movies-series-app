class AddProcessingToVideo < ActiveRecord::Migration[5.2]
  def change
    add_column :videos, :video_tmp, :string
    add_column :videos, :video_processing, :boolean, null: false, default: false
  end
end
