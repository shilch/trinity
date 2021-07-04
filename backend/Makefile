dejavu: main.go
	docker run --rm --mount type=bind,source="$$(pwd -P)",target=/src "golang:1.16.5-alpine" sh -c "cd /src && go build -o backend main.go"

.PHONY: clean
clean:
	rm -f backend
