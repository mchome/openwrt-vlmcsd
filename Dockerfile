FROM debian:buster

# Init
SHELL ["/bin/bash", "-c"]
RUN apt-get update
RUN apt-get install -y curl wget xz-utils git build-essential libncurses5-dev gawk unzip python file

# Prepare sdk
WORKDIR /build
ARG URL
RUN curl -s -O $URL
RUN FILE="${URL##*/}" && tar xf "${FILE}" &&  mv "${FILE%.*.*}" sdk
ADD . /build/sdk/package/openwrt-vlmcsd/

# Config
WORKDIR /build/sdk
RUN make defconfig
RUN sed -i 's/CONFIG_PACKAGE_openwrt-vlmcsd=m/CONFIG_PACKAGE_openwrt-vlmcsd=y/g' .config

# Compile
RUN make package/openwrt-vlmcsd/compile V=99

# Output
WORKDIR /output
RUN mv `find /build/sdk/bin/packages/ | grep openwrt-vlmcsd` .

ENTRYPOINT ["/bin/bash", "-c", "python3 -u -m http.server -b `awk 'END{print $1}' /etc/hosts` 80"]
