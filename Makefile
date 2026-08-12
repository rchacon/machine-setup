SHELL := /bin/bash

.PHONY: ubuntu macbook install

install:
	python3 -m venv .venv && \
	source .venv/bin/activate && \
	python3 -m pip install -r requirements.txt

ubuntu:
	source .env && \
	source .venv/bin/activate && \
	cd deployment && \
	ansible-playbook -i local ubuntu.yml -K -e "github_name=$$GITHUB_NAME" -e "github_email=$$GITHUB_EMAIL"

macbook:
	source .env && \
	cd deployment && \
	ansible-playbook -i local macbook.yml -K -e "github_name=$$GITHUB_NAME" -e "github_email=$$GITHUB_EMAIL"
