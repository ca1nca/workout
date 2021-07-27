# Workout
A Rails Test Project

## Description
This is a small project created as a Rails refresher.

## Requirements
Docker Desktop must be installed

## How to Build
1. Make sure Docker is installed (along with docker-compose). I prefer just installing Docker Desktop.
2. Run `docker-compose up` to build all the containers (NOTE: I only tested this with MacOS, so it may vary slightly between systems).
3. Note, if an error regarding a missing gem (e.g. nokogiri) shows up, please delete the Gemfile.lock and run `docker-compose build --force-rm --no -cache`.
   For the purposes of this toy app, Gem version conformity is not incredibly important.

## How to Test
1. Enter the app service container with `docker-compose exec app sh`
2. Run `rake test`

## How to Use
1. The base URL is `http://localhost:3001/api/v1/program`
2. To query for workout programs that contains a subset of the equipment you list, add the query param `equipment[]=<name of equipment>`. To query a workout
   program that uses multiple pieces of equipment, add another `equipment[]=<name of other equipment>` like so:
   ```
   http://localhost:3001/api/v1/program?equipment[]=barbell&equipment[]=bench
   ```
   This will retrieve all programs that contain a subset of {barbell, bench}
3. To query for workout programs for a certain sport, add the query param `sport=<name of sport>`
4. To query for workout programs that don't require any equipment, add `equipment[]=` and do not pass in a value

## Limitations
- This is a very basic piece of software. There is no authentication and because I have never personally set up a database using Rails, the schema
may not be entirely correct. Using Django (which I have professional experience in), A migration can be created directly from a model whereas with Rails,
this is not how it works.

- The only feature is to fetch a program, so the data is fixed

- Sensitive ENV information should always be stored in a .env file and never committed to a public repository. For this toy app, to keep things simple, I left the env variables directly in the docker-compose.yml file
