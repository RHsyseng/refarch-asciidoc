DOCS=ra-template-v2

all: $(DOCS) html pdf

html: $(DOCS)
	asciidoctor $(DOCS).adoc

pdf: $(DOCS)
	ruby /usr/local/bin/asciidoctor-pdf -a pdf-style=asciidoctor $(DOCS).adoc

clean:
	rm -f $(DOCS).html $(DOCS).pdf
