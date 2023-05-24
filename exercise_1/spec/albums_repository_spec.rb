require 'albums_repository'

RSpec.describe AlbumsRepository do
  def reset_albums_table
    seed_sql = File.read('spec/seeds_albums.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_albums_table
  end
  it 'Returns a list of albums' do
    repo = AlbumsRepository.new
    albums = repo.all
    expect(albums.length).to eq(3)
    expect(albums.first.id).to eq('1')
    expect(albums.first.title).to eq "Continuum"
  end
  it 'Returns single album based on id' do
    albums = AlbumsRepository.new
    result = albums.find('3')
    expect(result.first.title).to eq 'Waterloo'
  end
  it 'create a new album in the table' do
    repo = AlbumsRepository.new
    album = Albums.new
    album.title = 'Trompe le Monde'
    album.release_year = '1991'
    album.artist_id = 1
    repo.create(album)
    all_albums = repo.all
    expect(all_albums).to include(have_attributes(title: album.title,release_year: album.release_year))
  end

end