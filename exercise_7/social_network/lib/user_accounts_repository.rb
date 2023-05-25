require 'user_account'
class UserAccountsRepository

  def all
    sql = 'SELECT id, email, username FROM user_accounts'
    result_set = DatabaseConnection.exec_params(sql, [])

    users = []

    result_set.each do |record|
      user = UserAccount.new
      user.id = record['id']
      user.email = record['email']
      user.username = record['username']

      users << user
    end
    return users
    # Executes the SQL query:
    # SELECT id, email, username FROM user_accounts;

    # Returns an array of User_Account objects.
  end

  def find(id)
    sql = 'SELECT id, email, username FROM user_accounts WHERE id = $1;'
    params = [id]
    result_set = DatabaseConnection.exec_params(sql, params)

    users = []

    result_set.each do |record|
      user = UserAccount.new
      user.id = record['id']
      user.email = record['email']
      user.username = record['username']

      users << user
    end
    return users
  end

  def create(user_account)
    #INPUT INTO user_accounts SET ('email', 'username')
    sql = 'INSERT INTO user_accounts (email, username) VALUES($1, $2);'
    params = [user_account.email, user_account.username]
    result= DatabaseConnection.exec_params(sql, params)
    return nil
  end

  def delete(id)
    sql = 'DELETE FROM user_accounts WHERE id = $1;'
    params = [id]
    result_set = DatabaseConnection.exec_params(sql, params)
    return nil
  end
end