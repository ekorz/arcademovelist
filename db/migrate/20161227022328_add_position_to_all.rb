class AddPositionToAll < ActiveRecord::Migration
  def change
  	add_column :builds, :position, :integer
  	add_column :setups, :position, :integer
  	add_column :notes, :position, :integer
  	add_column :characters, :position, :integer
  end
end
