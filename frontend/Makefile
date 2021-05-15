.PHONY: yarn install
install:
	docker-compose run --rm app yarn install

.PHONY: yarn dev
up:
	docker-compose run -e NUXT_HOST=0.0.0.0 -p 3004:3004 --rm app yarn dev