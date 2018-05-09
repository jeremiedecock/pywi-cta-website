all: help

.PHONY : help \
		 publish \

## HELP #######################################################################

help:
	@echo ''
	@echo 'Available make targets:'
	@echo ''
	@echo '  help           Print this help message (the default)'
	@echo '  publish        Upload the web site'
	@echo ''

## PUBLISH ####################################################################

publish:
	# TODO_DOCS_URI is a shell environment variable that contains the
	# destination URI of the HTML files.
	@if test -z $$TODO_DOCS_URI ; then exit 1 ; fi

	# Upload the HTML files
	rsync -r -v -e ssh --exclude=".gitignore" --exclude=".git/" ./ ${TODO_WEBSITE_URI}/
