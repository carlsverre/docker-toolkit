.PHONY: push
push: result
	docker push carlsverre/docker-toolkit

.fingerprint: default.nix
	nix-build
	docker load < result
