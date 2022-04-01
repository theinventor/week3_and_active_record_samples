class AddLatToTrip < ActiveRecord::Migration[7.0]
  def change
    add_column :trips, :lattitude, :decimal, :precision => 15, :scale => 10
    add_column :trips, :longitude, :decimal, :precision => 15, :scale => 10
  end
end
