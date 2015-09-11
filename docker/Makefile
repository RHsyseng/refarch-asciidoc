stable-watermark:
	asciidoctor-pdf -a pdf-style=asciidoctor-watermark -r asciidoctor-diagram $(docname)
#Example: sudo docker run -v /local/path/to/paper:/paper -i -t asciidoctor:stable-alpha9 make docname=<filename> && evince <filename>.pdf
#NOTE: :/paper is the remote location within docker image, leave as is

stable-no-watermark:
	asciidoctor-pdf -a pdf-style=asciidoctor-no-watermark -r asciidoctor-diagram $(docname)
#Example: sudo docker run -v /local/path/to/paper:/paper -i -t asciidoctor:stable-alpha9 make stable-no-watermark docname=<filename> && evince <filename>.pdf
#NOTE: :/paper is the remote location within docker image, leave as is

clean:
	find . -type f -name `basename "$(docname)" | cut -d. -f1`.pdf -exec rm -f {} \;
	find . -type f -name \*.pdfmarks -exec rm -f {} \;
#Example: sudo docker run -v /local/path/to/paper:/paper -i -t asciidoctor:stable-alpha9 make clean docname=<filename>

# Below is used for development purposes. It can be used to check out the latest upstream asciidoctor-pdf features.

dev-no-watermark:
	ruby /asciidoctor-pdf/bin/asciidoctor-pdf -a pdf-style=asciidoctor-no-watermark -r asciidoctor-diagram $(docname)
#Example: sudo docker run -v /local/path/to/paper:/paper -i -t asciidoctor:dev-9-10-2015 make dev-no-watermark docname=<filename> && evince <filename>.pdf
#NOTE: :/paper is the remote location within docker image, leave as is
dev-watermark:
	ruby /asciidoctor-pdf/bin/asciidoctor-pdf -a pdf-style=asciidoctor-watermark -r asciidoctor-diagram $(docname)
#Example: sudo docker run -v /local/path/to/paper:/paper -i -t asciidoctor:dev-9-10-2015 make dev-watermark docname=<filename> && evince <filename>.pdf
#NOTE: :/paper is the remote location within docker image, leave as is
