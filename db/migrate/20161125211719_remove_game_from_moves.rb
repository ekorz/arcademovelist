class RemoveGameFromMoves < ActiveRecord::Migration
  def change
    remove_reference :moves, :game, index: true
  end
end
