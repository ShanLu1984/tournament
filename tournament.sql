-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

-- create datebase tournament
drop database if exists tournament;
create database tournament;


-- connect to database 
\c tournament;


-- players table contains player name and player id
-- | name | id | --
create table players(
  name text,
  id serial primary key
);


-- matches table contains matches winner, loser and match id
-- | winner | loser | id | -- 
create table matches(
  winner integer references players(id),
  loser integer references players(id),
  id serial primary key
);


-- view play_wins contains player id, player name and number of wins of the playr
-- | id | name | wins | --
create view player_wins as 
  select players.id, players.name, count(matches.winner) as wins
  from players left join matches
  on players.id = matches.winner 
  group by players.id order by wins desc;

-- view player_matches contains player id, player name and number of matches of the player
-- | id | name | matches | --
create view player_matches as
  select players.id, players.name, count(matches.winner) as matches
  from players left join matches
  on players.id = matches.winner or players.id = matches.loser
  group by players.id;

-- view player_standings contains player id, player name, number of wins, number of matches
-- | id | name | wins | matches | --
create view player_standings as
  select player_wins.id, player_wins.name, player_wins.wins, player_matches.matches
  from player_wins join player_matches
  on player_wins.id = player_matches.id
  order by player_wins.wins desc; 
