FROM node:16 as skeleton
ARG TIMEZONE

RUN apt-get update && apt-get install -y tzdata

ENV TZ=${TIMEZONE}

# Set timezone
RUN ln -snf /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && echo ${TIMEZONE} > /etc/timezone
RUN "date"

# update npm
RUN npm install -g npm@8.19.2

WORKDIR /skeleton