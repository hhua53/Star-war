class Person < ApplicationRecord
  belongs_to :planet
  belongs_to :starship
  has_many :film_people
  has_many :film, :through => :film_people

  validates :name, presence: true, uniqueness: true
end
