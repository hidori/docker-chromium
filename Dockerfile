FROM node:12.18.3-alpine3.12

RUN apk update \
    && apk add --no-cache \
    ca-certificates \
    nss \
    freetype \
    freetype-dev \
    harfbuzz \
    ttf-freefont \
    tzdata \
    fontconfig \
    font-noto-cjk \
    && cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
    && echo "Asia/Tokyo" > /etc/timezone \
    && apk del tzdata \
    && fc-cache -fv

RUN apk add --no-cache \
    chromium=83.0.4103.116-r0
