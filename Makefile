PWD:=$(shell pwd)
DOCKER?=$(shell command -v docker 2>/dev/null || command -v podman)

.PHONY: pack-build
pack-build:
	$(DOCKER) build -t avro-nuget-packer ./pack

.PHONY: pack-run
pack-run:
	$(DOCKER) run --rm -it --name avro-nuget-packer \
		--volume $(PWD)/../avro-nuget-sandbox/contracts:/contracts --volume $(PWD)/artifacts:/artifacts \
		avro-nuget-packer \
			--package-name=EP.Avro-NuGet-Sandbox.Contracts \
			--package-version=1.5.0 \
			--avro-dir-path=/contracts \
			--output-path=./artifacts \
			--company=EP \
			--authors="Team Void"


#--------- Debugging ---------------------------------------
.PHONY: pack-shell
pack-shell:
	$(DOCKER) run --rm -it --name avro-nuget-packer \
		--volume $(PWD)/../avro-nuget-sandbox/contracts:/contracts --volume $(PWD)/artifacts:/artifacts \
		--entrypoint /bin/sh \
		avro-nuget-packer 

.PHONY: entrypoint
entrypoint:
	./bin/entrypoint.sh --package-name=EP.Avro-NuGet-Sandbox.Contracts --package-version=1.5.0 --avro-dir-path=/contracts --output-path=./artifacts --company=EP --authors="Team Void"

