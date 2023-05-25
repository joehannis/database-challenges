require 'post'

class PostsRepository
  def all
    sql = 'SELECT id, title, content, views, user_account_id FROM posts'
    result_set = DatabaseConnection.exec_params(sql, [])

    posts = []

    result_set.each do |record|
      post = Post.new
      post.id = record['id']
      post.title = record['title']
      post.content = record['content']
      post.views = record['views']
      post.user_account_id = record['user_account_id']

      posts << post
    end
    return posts
    # Executes the SQL query:
    # SELECT id, email, username FROM user_accounts;

    # Returns an array of User_Account objects.
  end

  def find(id)
    sql = 'SELECT id, title, content, views, user_account_id FROM posts WHERE id = $1;'
    params = [id]
    result_set = DatabaseConnection.exec_params(sql, params)

    posts = []

    result_set.each do |record|
      post = Post.new
      post.id = record['id']
      post.title = record['title']
      post.content = record['content']
      post.views = record['views']
      post.user_account_id = record['user_account_id']

      posts << post
    end
    return posts
  end

  def create(post)
    sql = 'INSERT INTO posts (title, content, views, user_account_id) VALUES($1, $2, $3, $4);'
    params = [post.title, post.content, post.views, post.user_account_id]
    result= DatabaseConnection.exec_params(sql, params)
    return nil
  end

  def delete(id)
    sql = 'DELETE FROM posts WHERE id = $1;'
    params = [id]
    result_set = DatabaseConnection.exec_params(sql, params)
    return nil
  end
end

