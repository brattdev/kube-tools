TAG?=v1

build:
	docker build -t systemctldev/kube-tools:$(TAG) . -f Dockerfile

push:
	docker push systemctldev/kube-tools:$(TAG)
