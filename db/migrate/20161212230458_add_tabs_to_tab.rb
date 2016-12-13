class AddTabsToTab < ActiveRecord::Migration
  def change
  	add_reference :tabs, :tab, index: true
  end
end
