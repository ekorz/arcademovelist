class RemoveTabsFromTab < ActiveRecord::Migration
  def change
  	remove_reference :tabs, :tab, index: true
  end
end
