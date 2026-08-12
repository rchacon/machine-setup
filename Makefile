SHELL := /bin/bash

.PHONY: install run post-run

install:
	python3 -m venv .venv && \
	source .venv/bin/activate && \
	python3 -m pip install -r requirements.txt

run:
	source .env && \
	if [ "$$TARGET" = "ubuntu" ]; then source .venv/bin/activate; fi && \
	cd deployment && \
	ansible-playbook -i local $$TARGET.yml -K -e "github_name=$$GITHUB_NAME" -e "github_email=$$GITHUB_EMAIL"

post-run:
	source .env && \
	if [ "$$TARGET" = "ubuntu" ]; then source .venv/bin/activate; fi && \
	cd deployment && \
	ansible-playbook -i local $$TARGET.yml -K --tags "never,post-install"
