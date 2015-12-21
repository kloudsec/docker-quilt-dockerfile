FROM ubuntu:14.04

#-- packages --#
RUN apt-get update  && \
	apt-get -y upgrade  && \
	apt-get -y install sudo wget git python-pip python-dev nano git

#-- setup structure --#
RUN mkdir -p /workspace

#-- install deps --#
WORKDIR /workspace
RUN git clone https://github.com/kloudsec/docker-quilt.git
WORKDIR /workspace/docker-quilt
RUN pip install -r requirements.txt
RUN sh /workspace/docker-quilt/manage init

#-- add init scripts --#
ADD scripts/run_quilt.sh /workspace/run_quilt.sh

EXPOSE 80
CMD ["/workspace/run_quilt.sh"]