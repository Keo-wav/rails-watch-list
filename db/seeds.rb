# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Movie.destroy_all

require "open-uri"

url = "https://tmdb.lewagon.com/movie/top_rated"
base_url = "https://image.tmdb.org/t/p/w500"
uri = URI.open(url).read
json = JSON.parse(uri)
 #retourne tableau de JSON
json["results"].each do |element|
  title = element["original_title"]
  overview = element["overview"]
  poster_url = base_url + element["poster_path"]
  rating = element["vote_average"]
  # puts element.overview
  Movie.create!(title: title, overview: overview, poster_url: poster_url, rating: rating)
end

List.create(name: 'Action')
List.create(name: 'Adventure')
List.create(name: 'Comedy')
List.create(name: 'Drama')
List.create(name: 'Horror')
List.create(name: 'Romantic')
List.create(name: 'Thriller')
List.create(name: 'Western')
