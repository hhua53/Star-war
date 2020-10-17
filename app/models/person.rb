class Person < ApplicationRecord
  belongs_to :planet

  has_many :person_starships
  has_many :starships, :through => :person_starships

  has_many :film_people
  has_many :films, :through => :film_people

  validates :name, presence: true, uniqueness: true
end
