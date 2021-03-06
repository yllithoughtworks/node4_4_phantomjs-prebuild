from node:4.4

# 1. Install compile and runtime dependencies
# 2. Compile PhantomJS from the source code
# 3. Remove compile depdencies
# We do all in a single commit to reduce the image size (a lot!)
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        libsqlite3-dev \
        libfontconfig1-dev \
        libicu-dev \
        libfreetype6 \
        libssl-dev \
        libpng-dev \
        libjpeg-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        g++ \
        git \
        flex \
        bison \
        gperf \
        perl \
        python \
        ruby \
    && git clone --recurse-submodules https://github.com/ariya/phantomjs /tmp/phantomjs \
    && cd /tmp/phantomjs \
    && ./build.py --release --confirm --silent >/dev/null \
    && mv bin/phantomjs /usr/local/bin \
    && cd \
    && apt-get purge --auto-remove -y \
        build-essential \
        g++ \
        git \
        flex \
        bison \
        gperf \
        ruby \
        perl \
        python \
    && apt-get clean \
    && rm -rf /tmp/* /var/lib/apt/lists/*

run export PATH="$PATH:/usr/local/lib/node_modules/phantomjs-prebuilt/bin/:"
run export PHANTOMJS_BIN="/usr/local/lib/node_modules/phantomjs-prebuilt/bin/phantomjs"
