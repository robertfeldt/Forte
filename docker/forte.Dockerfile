FROM dockerfile/julia:latest

MAINTAINER Robert Feldt <robert.feldt@gmail.com>

RUN apt-get update

COPY . /usr/src/forte

# Install Julia Packages in REQUIRE file
RUN julia /usr/src/forte/docker/install/installpackages.jl /usr/src/forte/docker/install/REQUIRE

CMD ["/bin/bash"]