class AddJammaKickHarnessButtonLayoutToSetup < ActiveRecord::Migration
  def change
    add_column :setups, :kick_harness, :boolean
    add_column :setups, :jamma, :boolean
    add_column :setups, :button_layout, :text
  end
end
