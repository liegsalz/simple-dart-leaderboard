# TicTacToe Backend

You can run the backend with:

`$ docker compose up --build`

Make sure to install [docker](https://docs.docker.com/engine/install/) and [docker-compose](https://docs.docker.com/compose/install/)

# Endpoints

GET /api/players -> gets all players

POST /api/players -> creates a new player. Expects body with {"name": name }

GET /api/players/<player_id> -> gets player with id player_id

POST /api/players/player_id/score/win -> adds a win to the player with id player_id