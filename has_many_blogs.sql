-- log in
-- psql -h localhost -p 8765 -U newuser;

CREATE USER has_many_user;
CREATE DATABASE has_many_blogs OWNER has_many_user;

\c has_many_blogs;

DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  username VARCHAR(90) NOT NULL,
  first_name VARCHAR(90) DEFAULT NULL,
  last_name VARCHAR(90) DEFAULT NULL,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

DROP TABLE IF EXISTS posts CASCADE;
CREATE TABLE posts(
  id SERIAL PRIMARY KEY,
  title VARCHAR(180) DEFAULT NULL,
  url VARCHAR(510) DEFAULT NULL,
  content TEXT DEFAULT NULL,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  userId INTEGER REFERENCES users(id)
);

DROP TABLE IF EXISTS comments CASCADE;
CREATE TABLE comments(
  id SERIAL PRIMARY KEY,
  body VARCHAR(510) DEFAULT NULL,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  userId INTEGER REFERENCES users(id),
  postId INTEGER REFERENCES posts(id)
);

