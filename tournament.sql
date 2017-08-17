-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

drop database if exists tournament;
drop table if exists players;
drop table if exists matches;
create database tournament;

\c tournament;

create table players(
name text,
id serial primary key);

create table matches(
winner serial references players(id),
loser serial references players(id));

create view player_wins as
 select players.id, players.name, count(matches.winner) as wins
 from players left join matches
 on players.id = matches.winner 
 group by players.id order by wins desc;

create view player_matches as
 select players.id, players.name, count(matches.winner) as matches
 from players left join matches
 on players.id = matches.winner or players.id = matches.loser
 group by players.id;

create view player_standings as
 select player_wins.id, player_wins.name, player_wins.wins, player_matches.matches
 from player_wins join player_matches
 on player_wins.id = player_matches.id
 order by player_wins.wins desc; 
