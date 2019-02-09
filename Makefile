.PHONY: push
push: .fingerprint
	docker push carlsverre/docker-toolkit

.fingerprint: default.nix
	nix-build
	docker load < result
	touch .fingerprint
