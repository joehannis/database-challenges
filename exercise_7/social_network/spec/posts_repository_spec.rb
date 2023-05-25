require 'posts_repository'
require 'post'

def reset_posts_table
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' })
  connection.exec(seed_sql)
end


describe PostsRepository do
  before(:each) do 
    reset_posts_table
  end
  it 'returns all posts' do
    repo = PostsRepository.new

    post = repo.all

    # expect(post.length).to eq 2

    expect(post[0].id).to eq '1'
    expect(post[0].title).to eq 'my title'
    expect(post[0].content).to eq 'lots of content'
    expect(post[0].views).to eq '100'
    expect(post[0].user_account_id).to eq '1'
  end
  it 'Returns single post based on id' do
    posts = PostsRepository.new
    result = posts.find('2')
    expect(result.first.title).to eq 'my title 2'
  end
  it 'creates an entry to the table' do
    repo = PostsRepository.new
    post = Post.new
    post.title = 'my title 4'
    post.content = 'lots of content 4'
    post.views = 400
    post.user_account_id = 2
    repo.create(post)
    all_posts = repo.all
    expect(all_posts.length).to eq 4
    expect(all_posts).to include(have_attributes(title: post.title,content: post.content))
  end
  it 'deletes an entry to the table' do
    repo = PostsRepository.new
    post = Post.new
    repo.delete(2)
    all_users = repo.all
    expect(all_users.length).to eq 2
  end
end
