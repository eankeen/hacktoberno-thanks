param := "thing"

test:
	docker build -t hacktoberno-thanks:default .
	@docker rm hacktoberno || true
	docker run \
		-it --name=hacktoberno \
		--mount type=bind,src="$(pwd)/test",dst=/test \
		hacktoberno-thanks:default {{param}}
