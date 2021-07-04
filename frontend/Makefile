.PHONY: frontend
frontend:
	docker run --rm --mount type=bind,source="$$(pwd -P)",target=/src cirrusci/flutter sh -c "cd /src && flutter pub get && flutter build web --no-source-maps"

.PHONY: clean
clean:
	rm -rf build
