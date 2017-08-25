require "sinatra"
require "pg"
require 'pry'

set :bind, '0.0.0.0'  # bind to all interfaces

configure :development do
  set :db_config, { dbname: "movies4" }
end

configure :test do
  set :db_config, { dbname: "movies_test" }
end

def db_connection
  begin
    connection = PG.connect(Sinatra::Application.db_config)
    yield(connection)
  ensure
    connection.close
  end
end
# ACTOR SECTION
get "/actors" do
  @actors = db_connection { |conn| conn.exec("SELECT * FROM actors ORDER BY name;") }
  erb :'actors/index'
end

get "/actors/:id" do
  db_connection do |conn|
    query = "SELECT *
    FROM cast_members
    JOIN movies ON movie_id = movies.id
    JOIN actors ON actor_id = actors.id
    WHERE actors.id = '#{params[:id]}';"
    @characters = conn.exec(query).to_a
    erb :'actors/show'
  end
end

### Movie Section
get "/movies" do
  @movies = db_connection { |conn| conn.exec("SELECT movies.id AS id, movies.title AS title, genres.name AS genre,
  studios.name AS studio, movies.year AS year, movies.rating AS rating
  FROM movies
  JOIN genres ON movies.genre_id = genres.id
  JOIN studios ON movies.studio_id = studios.id
  ORDER BY movies.title;") }
  erb :'movies/index'
end


get "/movies/:id" do
  db_connection do |conn|
    query = "SELECT movies.title, movies.year, movies.rating, actors.id AS actor_id,
    genres.name AS genre, studios.name AS studio, cast_members.character, actors.name AS actor,
    movies.synopsis
    FROM cast_members
    JOIN movies ON movie_id = movies.id
    JOIN actors ON actor_id = actors.id
    JOIN genres ON genre_id = genres.id
    JOIN studios ON studio_id = studios.id
    WHERE movies.id = '#{params[:id]}';"
    @cast = conn.exec(query).to_a
    erb :'movies/show'
  end
end
