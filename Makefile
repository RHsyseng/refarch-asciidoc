#
# Build a PDF document from Asciidoc source using a Docker container
#
# The specified container includes the asciidoc software.  It runs the
# document compiler on the source file (and any included files) and produces
# a matching PDF file.
#

all: draft

# This is the default document source
docroot=SETME_IN_MAKEFILE.adoc
docpdf=$(basename $(docroot)).pdf

# If the user has activated the docker group, no need to use sudo
SUDO=$(shell id | grep -q '(docker)' || echo sudo)

# Arguments for Docker to run with access to user file space
DOCKER_SWITCHES=--interactive --tty --privileged

# Mount the current working directory into the container to give access
DOCUMENT_VOLUME=--volume `pwd`:/paper

# Asciidoc compilation container image and release tags
ASCIIDOC_IMAGE=docker-registry.usersys.redhat.com/asciidoctor
ASCIIDOC_TAG_STABLE=stable-alpha10-v1
ASCIIDOC_TAG_DEV=dev-2015-11-17

#NOTE: :/paper is the internal location within docker image, leave as is
# 

#
# Draft documents have a watermark to indicate that they are not ready for
# release
#
draft:
	$(SUDO) docker run $(DOCKER_SWITCHES) $(DOCUMENT_VOLUME) \
	  $(ASCIIDOC_IMAGE):$(ASCIIDOC_TAG_STABLE) asciidoctor-pdf \
	      -a pdf-style=asciidoctor-watermark -r asciidoctor-diagram $(docroot)

#
# Release documents do not have a DRAFT watermark
#
release:
	$(SUDO) docker run $(DOCKER_SWITCHES) $(DOCUMENT_VOLUME) \
	  $(ASCIIDOC_IMAGE):$(ASCIIDOC_TAG_STABLE) asciidoctor-pdf \
	      -a pdf-style=asciidoctor-no-watermark -r asciidoctor-diagram $(docroot)

clean:
	rm -f $(docpdf)
	find . -type f -name \*.pdfmarks -exec rm -f {} \;

# Below is used for development purposes. It can be used to check out the latest upstream asciidoctor-pdf features.
#
# Draft documents have a watermark to indicate that they are not ready for
# release
#
draft-dev:
	$(SUDO) docker run $(DOCKER_SWITCHES) $(DOCUMENT_VOLUME) \
	  $(ASCIIDOC_IMAGE):$(ASCIIDOC_TAG_DEV) \
	      ruby /asciidoctor-pdf/bin/asciidoctor-pdf \
	        -a pdf-style=asciidoctor-watermark \
	        -r asciidoctor-diagram $(docroot)

#
# Release documents do not have a DRAFT watermark
#
release-dev:
	$(SUDO) docker run $(DOCKER_SWITCHES) $(DOCUMENT_VOLUME) \
	  $(ASCIIDOC_IMAGE):$(ASCIIDOC_TAG_DEV) \
	      ruby /asciidoctor-pdf/bin/asciidoctor-pdf \
	        -a pdf-style=asciidoctor-no-watermark \
	        -r asciidoctor-diagram $(docroot)
