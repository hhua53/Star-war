class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.string :name
      t.references :planet, null: false, foreign_key: true
      t.references :starship, null: false, foreign_key: true

      t.timestamps
    end
  end
end
