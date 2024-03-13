DROP DATABASE IF EXISTS soccer_leagues_db;

CREATE DATABASE soccer_leagues_db;

\c soccer_leagues_db

CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    ranking INT
);

CREATE TABLE players
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    teamid INT NOT NULL REFERENCES teams ON DELETE CASCADE
);

CREATE TABLE referees
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE seasons
(
    id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE matches
(
    id SERIAL PRIMARY KEY,
    seasonid INT NOT NULL REFERENCES seasons ON DELETE CASCADE,
    team1id INT NOT NULL REFERENCES teams ON DELETE CASCADE,
    team2id INT NOT NULL REFERENCES teams ON DELETE CASCADE,
    refereeid INT NOT NULL REFERENCES referees ON DELETE CASCADE
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    playerid INT NOT NULL REFERENCES players ON DELETE CASCADE,
    matchid INT NOT NULL REFERENCES matches ON DELETE CASCADE
);
