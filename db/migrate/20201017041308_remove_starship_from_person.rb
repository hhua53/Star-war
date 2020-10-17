class RemoveStarshipFromPerson < ActiveRecord::Migration[6.0]
  def change
    remove_reference :people, :starship, null: false, foreign_key: true
  end
end
