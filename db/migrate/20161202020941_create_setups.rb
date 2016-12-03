class CreateSetups < ActiveRecord::Migration
  def change
    create_table :setups do |t|

      t.timestamps
    end
  end
end
