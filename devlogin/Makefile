devlogin: devlogin.cpp
	docker run --rm --mount type=bind,source="$$(pwd -P)",target=/src alpine sh -c "cd /src && apk update && apk add build-base openssl-dev && g++ -std=c++17 -o devlogin devlogin.cpp -lcrypto"

.PHONY: clean
clean:
	rm -f devlogin
