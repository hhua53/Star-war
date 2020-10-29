require 'open-uri'
require 'open_uri_redirections'
require 'json'

FilmPerson.delete_all
FilmPlanet.delete_all
FilmStarship.delete_all
PersonStarship.delete_all
Film.delete_all
Person.delete_all
Planet.delete_all
Starship.delete_all


def swapi_fetch(url)
  JSON.parse(URI.open(url, :allow_redirections => :all).read)
end

def person_url(id)
  "https://swapi.dev/api/people/#{id}"
end

people_ids = 1..10

people_ids.each do |id|
  person_json = swapi_fetch(person_url(id))
  planet_url = person_json["homeworld"]
  films_urls = person_json["films"]
  starships_urls = person_json["starships"]

  planet_json = swapi_fetch(planet_url)
  planet_entry = Planet.find_or_create_by(name: planet_json["name"], population: planet_json["population"])

  people_entry = planet_entry.people.find_or_create_by(name: person_json["name"] )

  starships_urls.each do |starship_url|
    starship_json = swapi_fetch(starship_url)
    starship_entry = Starship.find_or_create_by(name: starship_json["name"])
    PersonStarship.find_or_create_by(person: people_entry, starship: starship_entry)
  end

  films_urls.each do |film_url|
    film_json = swapi_fetch(film_url)
    film_entry = Film.find_or_create_by(title: film_json["title"])
    FilmPerson.find_or_create_by(person: people_entry, film: film_entry)

    starships_urls_in_the_film = film_json["starships"]
    planets_urls_in_the_film = film_json["planets"]

    starships_urls_in_the_film.each do |starship_url|
      starship_json = swapi_fetch(starship_url)
      starship_entry = Starship.find_or_create_by(name: starship_json["name"])
      FilmStarship.find_or_create_by(film: film_entry, starship: starship_entry)
    end

    planets_urls_in_the_film.each do |planet_url_in_the_film|
      planet_json = swapi_fetch(planet_url_in_the_film)
      planet_entry = Planet.find_or_create_by(name: planet_json["name"], population: planet_json["population"])
      FilmPlanet.find_or_create_by(film: film_entry, planet: planet_entry)
    end

  end
end


