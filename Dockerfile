#
# title:       Ubuntu with Valgrind Dockerfile
#
# description: creates a docker image with valgrind, ncurses and the
# description: German ISO-8859-1 charset
#
# author:      GatCode
# year:        2017
# notes:       please feel free to adapt it to your needs
#

# Pull ubuntu image.
FROM ubuntu:latest

# Install basics
RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y valgrind
RUN apt-get install -y libncurses-dev

# Install character encoding
RUN apt-get install -y locales
RUN locale-gen de_DE
ENV LANG de_DE
ENV LANGUAGE de_DE
ENV LC_ALL de_DE

# Default command
CMD ["bash"]
