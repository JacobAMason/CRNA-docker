FROM node:alpine

RUN apk --no-cache add bash && \
    apk --no-cache add --virtual build-deps \
    git make libtool m4 automake autoconf pkgconf g++ openssl-dev linux-headers   && \
    git clone https://github.com/facebook/watchman.git && cd watchman && \
    git checkout v4.9.0 && \
    ./autogen.sh && ./configure && make && make install && \
    cd .. && rm -rf watchman && \
    apk del build-deps && \
    yarn global add create-react-native-app react-native-cli

EXPOSE 19000-19001

WORKDIR /app

CMD yarn start

