require 'user_accounts_repository'
require 'user_account'

def reset_user_accounts_table
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' })
  connection.exec(seed_sql)
end


describe UserAccountsRepository do
  before(:each) do 
    reset_user_accounts_table
  end
  it 'returns all users' do
    repo = UserAccountsRepository.new

    user_account = repo.all

    # expect(user_account.length).to eq 2

    expect(user_account[0].id).to eq '1'
    expect(user_account[0].email).to eq 'johndoe@gmail.com'
    expect(user_account[0].username).to eq 'johndoe'
  end
  it 'Returns single user based on id' do
    users = UserAccountsRepository.new
    result = users.find('2')
    expect(result.first.email).to eq 'janedoe@gmail.com'
  end
  it 'creates an entry to the table' do
    repo = UserAccountsRepository.new
    user = UserAccount.new
    user.email = 'jimmydog@gmail.com'
    user.username = 'jimmydog'
    repo.create(user)
    all_users = repo.all
    expect(all_users.length).to eq 3
    expect(all_users).to include(have_attributes(email: user.email,username: user.username))
  end
  it 'deletes an entry to the table' do
    repo = UserAccountsRepository.new
    user = UserAccount.new
    user.email = 'jimmydog@gmail.com'
    user.username = 'jimmydog'
    repo.create(user)
    repo.delete(2)
    all_users = repo.all
    expect(all_users.length).to eq 2
  end
end
