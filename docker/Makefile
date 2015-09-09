# Example run:
# docker run -v /home/scollier/git_projects/ose-ha:/paper -i -t asciidoctor:dev-9-9-2015 make docname=ose-dis-arch-Title && evince ose-dis-arch-Title.pdf

LABS=$(docname).adoc

pdf: $(LABS) 
	ruby /asciidoctor-pdf/bin/asciidoctor-pdf  -a pdf-style=asciidoctor-watermark $(docname).adoc
	
clean:
	find . -type f -name $(docname).pdf -exec rm -f {} \;
	find . -type f -name \*.pdfmarks -exec rm -f {} \;

no-watermark:
	ruby /asciidoctor-pdf/bin/asciidoctor-pdf -a pdf-style=asciidoctor-no-watermark $(docname).adoc
