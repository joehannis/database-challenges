require_relative 'lib/database_connection'
require_relative 'lib/artist_repository'
require_relative 'lib/albums_repository'

DatabaseConnection.connect('music_library')

p "All Artists"

artist_repository = ArtistRepository.new

artist_repository.all.each do |artist|
  p artist
end

p "All Albums"

albums_repository = AlbumsRepository.new

albums_repository.all.each do |album|
  p album
end

p "Find album"

albums_repository = AlbumsRepository.new

albums_repository.find(3).each do |album|
  p album
end