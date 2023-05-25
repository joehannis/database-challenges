-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE user_accounts, posts RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO user_accounts (email, username) VALUES ('johndoe@gmail.com', 'johndoe');
INSERT INTO user_accounts (email, username) VALUES ('janedoe@gmail.com', 'janedoe');
INSERT INTO posts (title, content, views, user_account_id) VALUES ('my title', 'lots of content', 100, 1);
INSERT INTO posts (title, content, views, user_account_id) VALUES ('my title 2', 'lots of content 2', 200, 1);
INSERT INTO posts (title, content, views, user_account_id) VALUES ('my title 3', 'lots of content 3', 300, 2);