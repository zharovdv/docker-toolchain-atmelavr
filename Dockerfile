FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && \
    apt-get install -y \
        automake \
        bison \
        flex \
        g++ \
        g++-mingw-w64-i686 \
        gcc \
        gcc-mingw-w64-i686 \
        guile-2.0-dev \
        m4 \
        make \
        patch \
        pkg-config \
        texinfo \
        wget \
        xz-utils \
        zip

COPY build.sh .
COPY entrypoint.sh .
COPY cmd.sh .

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/cmd.sh"]

#ENV PATH=/objdir/bin:$PATH