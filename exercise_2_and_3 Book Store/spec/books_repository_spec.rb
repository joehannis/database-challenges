# file: spec/student_repository_spec.rb
require 'books_repository'
require 'book'

def reset_books_table
  seed_sql = File.read('spec/book_store_test.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store_test' })
  connection.exec(seed_sql)
end

describe BooksRepository do
  before(:each) do 
    reset_books_table
  end
  it 'returns all book entries' do
    repo = BooksRepository.new

    book = repo.all

    expect(book.length).to eq 2

    expect(book[0].id).to eq "1"
    expect(book[0].title).to eq 'Nineteen Eighty-Four'
    expect(book[0].author_name).to eq 'George Orwell'
  end

  # (your tests will go here).
end