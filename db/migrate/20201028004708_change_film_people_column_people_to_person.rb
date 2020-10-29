class ChangeFilmPeopleColumnPeopleToPerson < ActiveRecord::Migration[6.0]
  def change
    rename_column :film_people, :people_id, :person_id
  end
end
