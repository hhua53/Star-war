class Starship < ApplicationRecord
  has_many :film_starships
  has_many :films, :through => :film_starships

  validates :name, presence: true, uniqueness: true
end
