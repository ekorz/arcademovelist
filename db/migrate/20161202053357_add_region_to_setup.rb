class AddRegionToSetup < ActiveRecord::Migration
  def change
    add_column :setups, :region, :string
  end
end
