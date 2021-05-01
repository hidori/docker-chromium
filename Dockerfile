ARG NODE_VERSION
ARG ALPINE_VERSION

FROM node:${NODE_VERSION}-alpine${ALPINE_VERSION}

ARG CHROMIUM_VERSION

RUN npm i -g npm

RUN apk update && apk add --no-cache \
    ca-certificates \
    nss \
    freetype \
    freetype-dev \
    harfbuzz \
    ttf-freefont \
    tzdata \
    fontconfig \
    font-noto-cjk

RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
    && echo "Asia/Tokyo" > /etc/timezone \
    && apk del tzdata \
    && fc-cache -fv

RUN apk add --no-cache \
    chromium=${CHROMIUM_VERSION}

RUN addgroup -S user \
    && adduser -S -g user user \
    && mkdir -p /home/user/Downloads \
    && chown -R user:user /home/user
