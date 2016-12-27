class AddPositionToFatalities < ActiveRecord::Migration
  def change
  	add_column :fatalities, :position, :integer
  end
end
