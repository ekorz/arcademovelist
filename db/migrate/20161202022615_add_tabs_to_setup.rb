class AddTabsToSetup < ActiveRecord::Migration
  def change
  	add_reference :setups, :tab, index: true	
  end
end
