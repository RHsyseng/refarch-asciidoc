LABS=ose-dis-arch-Title.adoc


pdf: $(LABS) 
	ruby /asciidoctor-pdf/bin/asciidoctor-pdf -a pdf-style=asciidoctor-watermark ose-dis-arch-Title.adoc
	
clean:
	find . -type f -name ose-dis-arch-Title.pdf -exec rm -f {} \;
	find . -type f -name \*.pdfmarks -exec rm -f {} \;

no-watermark:
	ruby /asciidoctor-pdf/bin/asciidoctor-pdf -a pdf-style=asciidoctor-no-watermark ose-dis-arch-Title.adoc
