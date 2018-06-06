.PHONY: help build start test stop

ENV_FILE=$(PWD)/.env

# Get current directory
MKFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
CURRENT_DIR := $(dir $(MKFILE_PATH))

ifneq ("$(wildcard $(ENV_FILE))", "")
	include $(ENV_FILE)
	export $(shell sed 's/=.*//' $(ENV_FILE))
endif

help: ##   shows all available targets
	echo ""
	echo "${DOCKER_NAME}"
	echo ""
	fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/\(.*\)\:.*##/\1:/'
	echo ""

build: ##  builds container image
	docker-compose build

start: ##  start container
	docker-compose up -d

test: ##   run all tests
	echo "Checking localhost:80"
	tests/test_url.sh http://localhost:80
	echo "Checking https://localhost"
	tests/test_url.sh https://localhost
	echo "Checking localhost:9000"
	tests/test_url.sh http://localhost:9000

stop: ##   stops and removes container
	docker-compose down