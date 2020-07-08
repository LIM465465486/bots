SHELL := /usr/bin/env bash

####################
## Stack Commands ##
####################

setup: bundle-install pull-images pull-dependencies

setup-build: rebuild pull-dependencies

rebuild: bundle-install build

bundle-install:
	bundle install --path .bundle/gems

start:
	bundle exec docker-sync-stack start

start-services:
	docker-compose -f docker-compose.yml -f docker-compose-dev.yml up

start-sync:
	bundle exec docker-sync start --foreground

clean:
	bundle exec docker-sync-stack clean

pull-images:
	docker-compose pull

push-images:
	docker-compose push

pull-dependencies:

build:
	docker-compose build

build-dev:
	docker-compose -f docker-compose.yml -f docker-compose-dev.yml build

#########################
## Individual Commands ##
#########################

GH_PAGES_SOURCES = docs license.rst setup.py
ghpages:
	git checkout gh-pages
	rm -rf _build _sources _static _modules
	git checkout master $(GH_PAGES_SOURCES)
	git reset HEAD
	cd docs;
	make -f Makefile html;
	mv -fv _build/html/* ../;
	cd ..;
	rm -rf $(GH_PAGES_SOURCES) _build
	git add -A
	git commit -m "Generated gh-pages" && git push origin gh-pages ; git checkout master
