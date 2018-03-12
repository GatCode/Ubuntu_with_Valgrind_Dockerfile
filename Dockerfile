#
# title:       Ubuntu with Valgrind Dockerfile
#
# description: creates a docker image with valgrind, ncurses, cmake 3.11,
# description: gcc/++-7 and the German ISO-8859-1 charset
#
# author:      GatCode
# year:        2018
# notes:       please feel free to adapt it to your needs
#

# Pull ubuntu image.
FROM ubuntu:latest

# Install basics
RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y valgrind
RUN apt-get install -y libncurses-dev
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:ubuntu-toolchain-r/test
RUN apt-get update
RUN apt-get install -y gcc-7 g++-7

# Install character encoding
RUN apt-get install -y locales
RUN locale-gen de_DE
ENV LANG de_DE
ENV LANGUAGE de_DE
ENV LC_ALL de_DE

# Install cmake
ADD https://cmake.org/files/v3.11/cmake-3.11.0-rc3-Linux-x86_64.sh /cmake-3.11.0-rc3-Linux-x86_64.sh
RUN mkdir /opt/cmake
RUN sh /cmake-3.11.0-rc3-Linux-x86_64.sh --prefix=/opt/cmake --skip-license
RUN ln -s /opt/cmake/bin/cmake /usr/local/bin/cmake

# Default command
CMD ["bash"]
