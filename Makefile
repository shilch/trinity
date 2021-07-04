.PHONY: image
image: dejavu devlogin video frontend backend
	docker build -t registry.code.fbi.h-da.de/hc/trinity .

.PHONY: dejavu
dejavu:
	${MAKE} -C dejavu

.PHONY: devlogin
devlogin:
	${MAKE} -C devlogin

.PHONY: video
video:
	${MAKE} -C video

.PHONY: frontend
frontend:
	${MAKE} -C frontend

.PHONY: backend
backend:
	${MAKE} -C backend

.PHONY: clean
clean:
	${MAKE} -C dejavu clean
	${MAKE} -C devlogin clean
	${MAKE} -C video clean
	${MAKE} -C frontend clean
	${MAKE} -C backend clean
