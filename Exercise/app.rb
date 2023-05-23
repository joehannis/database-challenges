require_relative 'lib/database_connection'
require_relative 'lib/artist_repository'
require_relative 'lib/albums_repository'

DatabaseConnection.connect('music_library')

artist_repository = ArtistRepository.new

artist_repository.all.each do |artist|
  p artist
end

albums_repository = AlbumsRepository.new

albums_repository.all.each do |album|
  p album
end