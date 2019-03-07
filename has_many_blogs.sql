-- log in
psql -h localhost -p 8765 -U newuser;

CREATE USER has_many_user;
CREATE DATABASE has_many_blogs OWNER has_many_user;

DROP TABLE IF EXISTS users;
CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  username VARCHAR(90) NOT NULL,
  first_name VARCHAR(90) DEFAULT NULL,
  last_name VARCHAR(90) DEFAULT NULL,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

DROP TABLE IF EXISTS posts;
CREATE TABLE posts(
  id SERIAL PRIMARY KEY,
  userId INTEGER REFERENCES users(id),
  title VARCHAR(180) DEFAULT NULL,
  url VARCHAR(510) DEFAULT NULL,
  content TEXT DEFAULT NULL,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

DROP TABLE IF EXISTS comments;
CREATE TABLE comments(
  id SERIAL PRIMARY KEY,
  userId INTEGER REFERENCES users(id),
  postId INTEGER REFERENCES posts(id),
  body VARCHAR(510) DEFAULT NULL,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

