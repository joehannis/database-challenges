require 'app'
require 'albums_repository'


RSpec.describe 'initalise' do
  def reset_albums_table
    seed_sql = File.read('spec/seeds_albums.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
    connection.exec(seed_sql)
  end
  def reset_artists_table
    seed_sql = File.read('spec/seeds_artists.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
    connection.exec(seed_sql)
  end
  before(:each) do
    reset_artists_table
    reset_albums_table
  end

  let(:io) { double(:io) }
  let(:albums) { AlbumsRepository.new }
  let(:artists) { ArtistsRepository.new }
  let(:app) { Application.new('music_library_test', io, albums, artists) }

  context 'integration' do
    it 'returns all albums' do
      allow(io).to receive(:puts)
      allow(io).to receive(:puts).and_return("1")
      allow(io).to receive(:gets).and_return("1") 
      expect(io).to receive(:puts).with("Welcome to the music library manager!")
      expect(io).to receive(:puts).with("  1 - List all albums")
      expect(io).to receive(:puts).with("  2 - List all artists")
      expect(io).to receive(:puts).with("Enter your choice:")
      expect(app.run).to include(have_attributes(title: "Continuum", release_year: "2006", artist_id: "4"))
    end
    it 'returns all albums' do
      allow(io).to receive(:puts)
      allow(io).to receive(:puts).and_return("2")
      allow(io).to receive(:gets).and_return("2") 
      expect(io).to receive(:puts).with("Welcome to the music library manager!")
      expect(io).to receive(:puts).with("  1 - List all albums")
      expect(io).to receive(:puts).with("  2 - List all artists")
      expect(io).to receive(:puts).with("Enter your choice:")
      expect(app.run).to include(have_attributes(name: "Pixies", genre: "Rock"))
    end
  end


      

     



end

