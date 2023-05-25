# file: app.rb

require_relative 'albums_repository'
require_relative 'artists_repository'
require_relative 'database_connection'

class Application
  attr_reader :albums_repository, :artists_repository

  # The Application class initializer
  # takes four arguments:
  #  * The database name to call `DatabaseConnection.connect`
  #  * the Kernel object as `io` (so we can mock the IO in our tests)
  #  * the AlbumRepository object (or a double of it)
  #  * the ArtistRepository object (or a double of it)
  def initialize(database_name, io, albums_repository, artists_repository)
    DatabaseConnection.connect(database_name)
    @io = io
    @albums_repository = albums_repository
    @artists_repository = artists_repository
  end

  def run
    @io.puts "Welcome to the music library manager!"
    @io.puts 'What would you like to do?'
    @io.puts "  1 - List all albums"
    @io.puts "  2 - List all artists"
    @io.puts "Enter your choice:"
    answer = @io.gets.chomp

    if answer == '1'
      p @albums_repository.all
    elsif answer == '2'
     p @artists_repository.all
    end
      
    
    # "Runs" the terminal application
    # so it can ask the user to enter some input
    # and then decide to run the appropriate action
    # or behaviour.

    # Use `@io.puts` or `@io.gets` to
    # write output and ask for user input.
  end
end

# Don't worry too much about this if statement. It is basically saying "only
# run the following code if this is the main file being run, instead of having
# been required or loaded by another file.
# If you want to learn more about __FILE__ and $0, see here: https://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Variables_and_Constants#Pre-defined_Variables
if __FILE__ == $0
  app = Application.new(
    'music_library',
    Kernel,
    AlbumsRepository.new,
    ArtistsRepository.new
  )
  app.run
end