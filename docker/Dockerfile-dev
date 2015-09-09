FROM centos:7

RUN yum install -y git rubygems make && \
yum clean all && \
gem install bundler

ENV DATE 9-9-2015

RUN git clone https://github.com/asciidoctor/asciidoctor-pdf 

RUN cd asciidoctor-pdf/ && \
    bundle 

ADD ./asciidoctor-no-watermark-theme.yml /asciidoctor-pdf/data/themes/asciidoctor-no-watermark-theme.yml
ADD ./asciidoctor-watermark-theme.yml /asciidoctor-pdf/data/themes/asciidoctor-watermark-theme.yml

ADD ./scripts/version.sh /version.sh
RUN chmod -v +x /version.sh

WORKDIR /paper
