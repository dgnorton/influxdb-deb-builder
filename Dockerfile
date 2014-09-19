FROM debian

RUN apt-get update
RUN apt-get install -y mercurial bzr protobuf-compiler flex bison \
  valgrind g++ make autoconf libtool libz-dev libbz2-dev curl \
  rpm build-essential git wget gawk sudo procps
RUN apt-get install -y ftp

RUN curl -o go.tar.gz https://storage.googleapis.com/golang/go1.3.1.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go.tar.gz
ENV PATH $PATH:/usr/local/go/bin

RUN curl -sSL https://get.rvm.io | bash -s stable
ENV PATH $PATH:/usr/local/rvm/bin
RUN rvm install ruby-1.9.3-p547

RUN mkdir -p go/bin go/pkg go/src/github.com/influxdb 
RUN cd go/src/github.com/influxdb && git clone http://github.com/influxdb/influxdb
RUN cd go/src/github.com/influxdb/influxdb && ./configure
