current_dir := $(shell pwd)
# COLORS
RED  := $(shell tput -Txterm setaf 1)
GREEN  := $(shell tput -Txterm setaf 2)
YELLOW := $(shell tput -Txterm setaf 3)
BLUE   := $(shell tput -Txterm setaf 4)
EOL  := $(shell tput -Txterm sgr0)

start: _build
build: _build
_build:
	@echo "${BLUE}>>> Building image phpcli_platform_converter${EOL}"
	@docker build --force-rm -t nodejs_dashboard_skeleton .

npm_install: _npm_install
_npm_install:
	@echo "${BLUE}>>> Running npm install...${EOL}"
	@docker run -it --rm -p 3000:3000 -v ${current_dir}:/skeleton -w /skeleton --name nodejs_dashboard_skeleton nodejs_dashboard_skeleton /bin/bash -c "npm install && npm rebuild node-sass"

run_dev: _run_dev
_run_dev:
	@echo "${BLUE}>>> Running...${EOL}"
	@docker run -it --rm -p 3000:3000 -v ${current_dir}:/skeleton -w /skeleton --name nodejs_dashboard_skeleton nodejs_dashboard_skeleton /bin/bash -c "npm run dev && node_modules/.bin/npm-run-all --parallel watch:server watch:build"

start: _start
_start:
	@echo "${BLUE}>>> Running...${EOL}"
	@docker run -it --rm -p 3000:3000 -v ${current_dir}:/skeleton -w /skeleton --name nodejs_dashboard_skeleton nodejs_dashboard_skeleton /bin/bash -c "npm run run"

stop: _stop
_stop:
	@echo "${BLUE}>>> Shutdown...${EOL}"
	@docker stop nodejs_dashboard_skeleton