FROM openjdk:8

# Buck's dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends apt-utils default-jdk ant python2.7 git

# Buck
RUN git clone --depth 1 https://github.com/facebook/buck.git
RUN cd buck && \
    ant && \
    ./bin/buck --version && \
    ln -sf $(realpath ./bin/buck) /usr/local/bin/buck && \
    buck --version
