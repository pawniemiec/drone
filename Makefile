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
	@echo ""
	@echo "Drone v0.8"
	@echo ""
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/\(.*\)\:.*##/\1:/'
	@echo ""

build: ##  builds container image
	@sudo rm -rf ./data/
	@mkdir -p ./data/
	docker-compose build

start: ##  start container
	docker-compose up -d

test: ##   run all tests
	@echo "Checking port 80"
	@nc -z localhost 80
	@echo "Checking port 443"
	@nc -z localhost 443
	@echo "Checking port 9000"
	@nc -z localhost 9000
	@echo -e "\n All tests passed!\n"

stop: ##   stops and removes container
	docker-compose down
