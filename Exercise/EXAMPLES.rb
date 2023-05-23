# EXAMPLES

# 1
# Get all albums

repo = AlbumsRepository.new

albums = repo.all

albums.length # =>  12

albums[0].id # =>  1
albums[0].title # =>  'Doolittle'
albums[0].release_year # =>  '1989'

albums[1].id # =>  2
albums[1].title # =>  'Surfer Rosa'
albums[1].release_year # =>  '1988'

# 2
# Get a single album

repo = AlbumsRepository.new

album = repo.find(1)

album.id # =>  1
album.title # =>  'Doolittle
album.release_year # =>  '1989'

# Add more examples for each method

# 3. Create a new album entry

repo = AlbumsRepository.new

repo.create("Continuum", "2006", "5")

SELECT * FROM albums WHERE title = album_title

# 4. Update an entry and then print the table to comfirm update

repo = AlbumsRepository.new

repo.update

SELECT * FROM albums

# 5. Delete an entry and then print the table to confirm deletion

repo = AlbumsRepository.new

repo.delete('Continuum')

SELECT * FROM albums
