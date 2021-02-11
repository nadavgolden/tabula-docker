_require_VERSION:
ifndef VERSION
	$(error VERSION not set. Use make rule VERSION=<version>)
endif

build: _require_VERSION
	docker build -t nadavgold/tabula:${VERSION} --build-arg TABULA_VERSION=${VERSION} -< Dockerfile

run: build
	docker run -d -p 8080:8080 -v ${shell pwd}/data:/data nadavgold/tabula:${VERSION}