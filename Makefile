.PHONY: build

CONTAINERNAME=deovim
IMAGENAME=tylerfowle/deovim

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build:
	docker build --rm -t ${IMAGENAME} .

run:
	docker run -ti --rm -v ${PWD}:/mnt/workspace --name ${CONTAINERNAME} ${IMAGENAME}

enter:
	docker exec -ti ${CONTAINERNAME} /bin/zsh
