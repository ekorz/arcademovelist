class AddNameToBuilds < ActiveRecord::Migration
  def change
  	add_column :builds, :name, :string
  	remove_column :builds, :fatalities, :boolean
  	remove_column :builds, :moves, :boolean
  end
end
