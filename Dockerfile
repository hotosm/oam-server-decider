FROM node:0.10-slim

MAINTAINER Humanitarian OpenStreetMap Team

ENV HOME /app
ENV PORT 8000

RUN mkdir -p  /app/decider
WORKDIR /app

COPY decider/package.json /app/

RUN npm install

RUN useradd \
  --home-dir /app/decider \
  --system \
  --user-group \
  oam \
  && chown -R oam:oam /app

USER oam
WORKDIR /app/decider

COPY . /app/decider

ENTRYPOINT ["npm"]
