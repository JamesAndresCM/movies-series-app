class AddTypesToSeries < ActiveRecord::Migration[5.2]
  def change
    add_reference :series, :type, foreign_key: true
  end
end
