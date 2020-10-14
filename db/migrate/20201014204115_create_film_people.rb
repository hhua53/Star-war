class CreateFilmPeople < ActiveRecord::Migration[6.0]
  def change
    create_table :film_people do |t|
      t.references :film, null: false, foreign_key: true
      t.references :people, null: false, foreign_key: true

      t.timestamps
    end
  end
end
