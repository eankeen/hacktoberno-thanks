param := "thing"

# Tests the local container on the local machine
test-local:
	docker build -t hacktoberno-thanks:default .
	@docker rm hacktoberno || true
	docker run \
		-it --name hacktoberno \
		--mount type=bind,src="$(pwd)/test",dst=/test \
		hacktoberno-thanks:default {{param}}

# Tests the remote container on the local machine
test-remote:
	act
