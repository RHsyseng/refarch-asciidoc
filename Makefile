stable-watermark:
	docker run --privileged=true -v `pwd`:/paper -i -t docker-registry.usersys.redhat.com/asciidoctor:stable-alpha10-v1 asciidoctor-pdf -a pdf-style=asciidoctor-watermark -r asciidoctor-diagram $(doc)
#NOTE: :/paper is the remote location within docker image, leave as is

stable-no-watermark:
	docker run --privileged=true -v `pwd`:/paper -i -t docker-registry.usersys.redhat.com/asciidoctor:stable-alpha10-v1 asciidoctor-pdf -a pdf-style=asciidoctor-no-watermark -r asciidoctor-diagram ose-dis-arch-Title.adoc
#NOTE: :/paper is the remote location within docker image, leave as is

clean:
	find . -type f -name `basename "$(doc)" | cut -d. -f1`.pdf -exec rm -f {} \;
	find . -type f -name \*.pdfmarks -exec rm -f {} \;



# Below is used for development purposes. It can be used to check out the latest upstream asciidoctor-pdf features.

dev-no-watermark:
	docker run --privileged=true -v `pwd`:/paper -i -t docker-registry.usersys.redhat.com/asciidoctor:dev-2015-11-17 ruby /asciidoctor-pdf/bin/asciidoctor-pdf -a pdf-style=asciidoctor-no-watermark -r asciidoctor-diagram $(doc)
#NOTE: :/paper is the remote location within docker image, leave as is

dev-watermark:
	docker run --privileged=true -v `pwd`:/paper -i -t docker-registry.usersys.redhat.com/asciidoctor:dev-2015-11-17 ruby /asciidoctor-pdf/bin/asciidoctor-pdf -a pdf-style=asciidoctor-watermark -r asciidoctor-diagram $(doc)
#NOTE: :/paper is the remote location within docker image, leave as is
