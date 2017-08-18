# tournament
## Introduction: 
  This is a course project of Udacity course: Relational Databases. In this project, you need to write a Python module that uses the PostgreSQL database to keep track of players and matches in a game tournament. 
The game tournament will use the Swiss system for pairing up players in each round: players are not eliminated, and each player should be paired with another player with the same number of wins, or as close as possible.
This project has two parts: defining the database schema (SQL table definitions), and writing the code that will use it. For details, you may refer to [GettingStartedGuide] https://docs.google.com/document/d/16IgOm4XprTaKxAa8w02y028oBECOoB1EI1ReddADEeY/pub?embedded=true.
## What's inside:
* tournament.sql
* tournament.py
* tournament_test.py
### Tables in *tournament.sql*:
**players**
Includes player's name and unique player id;

name | id
---- | ----

**matches**
Includes the winner id, loser id, and unique match id

winner | loser | id
---- | ---- | ----

**player_wins**
Includes player's id, player's name and number of wins of the player

id | name | wins
---- | ---- | ----

**player_matches**
Includes player's id, player's name and total of matches of the player

id | name | matches
---- | ---- | ----

**player_standings**
Includes player's id, player's name, player's wins and player's total matches

id | name | wins | matches
---- | ---- | ---- | ----

### Python functions in *tournament.py*:
function | input  | purpose
------------ | ------------- | ------------- 
registerPlayer(name) | name as string | register a player to the database
countPlayers() | (no input) | return the number of players currently registered
reportMatch(winner, loser) | winner as integer, loser as integer | records the outcome of a single match
playerStandings() | (no input) | return a list of the players' id, name, and win records, sorted by wins
swissPairings() | (no input) | returns a list of pairs of players for the next round of match

## How to run:
1. Install Vagrant https://www.vagrantup.com/ and VirtualBox https://www.virtualbox.org/.
1. Use Github to fork and clone the repository https://github.com/udacity/fullstack-nanodegree-vm.
1. Start Vagrant by changing the directory to the vagrant directory and run `vagrant up`
1. Log into Vagrant virtual machine with: `vagrant ssh`
1. Move to tournament directory: `cd /vagrant/tournament/`
1. Initialize the required tables: `psql` and then `\i tournament.sql`
1. Quit PostgreSQL by `\q` and run the test Python file
`python tournament_test.py`
