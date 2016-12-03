class AddTabsToCharacters < ActiveRecord::Migration
  def change
  	rename_column :characters, :game_id, :tab_id
  	rename_column :moves, :character_id, :tab_id
  end
end