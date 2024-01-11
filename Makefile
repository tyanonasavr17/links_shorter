init:
	docker-compose build
	docker-compose run --rm web rails db:create db:migrate
	mkdir -p tmp/pids
	docker-compose up -d

build:
	docker-compose build

up:
	docker-compose up -d

ps:
	docker-compose ps

down:
	docker-compose down

bash:
	docker-compose run --rm web bash

