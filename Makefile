export GOPROXY=https://proxy.golang.org,direct

.PHONY: build
build:
	go build -o bin/simple-bank cmd/simple-bank/main.go

.PHONY: run
run:
	go run cmd/simple-bank/main.go

.PHONY: test
test:
	go test -v ./...

.PHONY: migrate
migrate: .migrate

.PHONY: .install-migrate-deps
.install-migrate-deps:
		go get -u github.com/pressly/goose/v3/cmd/goose

.PHONY: .migrate
.migrate:
		sh migration.sh