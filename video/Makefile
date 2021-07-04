fb0.raw: fb0.png
	rm -f fb0.raw
	docker run --rm --mount type=bind,source="$$(pwd -P)",target=/src linuxserver/ffmpeg -vcodec png -i /src/fb0.png -vcodec rawvideo -f rawvideo -pix_fmt rgb565le /src/fb0.raw

.PHONY: clean
clean:
	rm -f rb0.raw
