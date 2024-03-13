DROP DATABASE IF EXISTS craigslist_db;

CREATE DATABASE craigslist_db;

\c craigslist_db

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    location TEXT NOT NULL,
    content TEXT NOT NULL
);

CREATE TABLE categories
(
    id SERIAL PRIMARY KEY,
    category TEXT NOT NULL
);

CREATE TABLE posts_categories
(
    id SERIAL PRIMARY KEY,
    postid INT NOT NULL REFERENCES posts ON DELETE CASCADE,
    categoryid INT NOT NULL REFERENCES categories ON DELETE CASCADE
);

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    name varchar(12) NOT NULL,
    public_key TEXT NOT NULL
);

CREATE TABLE regions
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE posts_regions
(
    id SERIAL PRIMARY KEY,
    doctorid INT NOT NULL REFERENCES posts ON DELETE CASCADE
);

CREATE TABLE users_regions
(
    id SERIAL PRIMARY KEY,
    userid INT NOT NULL REFERENCES users ON DELETE CASCADE
);
