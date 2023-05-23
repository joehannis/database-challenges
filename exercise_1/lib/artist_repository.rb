require_relative 'artist'
class ArtistRepository
  def all
    sql = 'SELECT id, name, genre FROM artists;'
    result_set = DatabaseConnection.exec_params(sql, [])

    artists = []

    result_set.each do |record|
      artist = Artist.new
      artist.id = record['id']
      artist.name = record['name']
      artist.genre = record['genre']

      artists << artist
    end
    return artists
  end
end
  # Selecting all records
  # No arguments
#   def all
#     sql = "SELECT * FROM albums;"
#     # Executes the SQL query:
#     # SELECT id, title, release_year, artist_id FROM albums;

#     # Returns an array of album objects.
#   end


#   # Gets a single record by its ID
#   # One argument: the id (number)
#   def find(id)
#     SELECT * FROM albums WHERE id = (id);
#     # Executes the SQL query:
#     # SELECT id, title, release_year, artist_id FROM albums WHERE id = $1;

#     # Returns a single Album object.
#   end

#   # Add more methods below for each operation you'd like to implement.

#   new_artist = Artist.new
#   artist.name = "Radiohead"
#   #etc etc

#   def create(new_artist)
#     # Inserts new artist into database
#     artist_repository.create(new_artist)


#   end

#   def update
#     puts "What would you like to update?"
#     answer = gets.chomp
#     if answer == title
#       UPDATE albums SET title = answer
#     elsif answer == "release year" or "release_year"
#       UPDATE albums SET release_year = answer
#     elsif answer == artist_id
#       UPDATE albums SET artist_id = answer
#     end
#   end

#   def delete(album)
#     #deletes album by title
#     DELETE FROM albums WHERE title = album
#   end
# end
