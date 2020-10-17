class Starship < ApplicationRecord
  has_many :film_starships
  has_many :films, :through => :film_starships

  has_many :person_starships
  has_many :people, :through => :person_starships

  validates :name, presence: true, uniqueness: true
end
