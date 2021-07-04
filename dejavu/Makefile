dejavu: main.go
	docker run --rm --mount type=bind,source="$$(pwd -P)",target=/src "golang:1.16.5-alpine" sh -c "apk update && apk add build-base libcap-dev && cd /src && go build -o dejavu main.go"

.PHONY: clean
clean:
	rm -f dejavu
