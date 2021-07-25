# Workout
A Rails Test Project

## Description
This is a small project created as a Rails refresher.

## Requirements
Docker Desktop must be installed

## How to Build
1. Make sure Docker is installed (along with docker-compose). I prefer just installing Docker Desktop.
2. Run `docker-compose up` to build all the containers (NOTE: I only tested this with MacOS, so it may vary slightly between systems).

## How to Test
1. Enter the app service container with `docker-compose exec app sh`
2. Run `rake test`

## How to Use
1. The base URL is `http://localhost:3001/api/v1/program`
2. To query for workout programs that contain a certain type of equipment, add the query param `equipment[]=<name of equipment>`. To query a workout
   program that uses multiple pieces of equipment, add another `equipment[]=<name of other equipment>` like so:
   ```
   http://localhost:3001/api/v1/program?equipment[]=football&equipment[]=basketball
   ```
3. To query for workout programs for a certain sport, add the query param `sport=<name of sport>`

## Limitations
- This is a very basic piece of software. There is no authentication and because I have never personally set up a database using Rails, the schema
may not be entirely correct. Using Django (which I have professional experience in), A migration can be created directly from a model whereas with Rails,
this is not how it works.

- The only feature is to fetch a program, so the data is fixed
