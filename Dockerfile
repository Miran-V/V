FROM debian:11-slim
RUN apt-get update && \
  apt-get -y install curl && \
  curl -s https://packagecloud.io/install/repositories/pufferpanel/pufferpanel/script.deb.sh | bash && \
  curl -SsL https://playit-cloud.github.io/ppa/key.gpg | gpg --dearmor | tee /etc/apt/trusted.gpg.d/playit.gpg >/dev/null && \
  echo "deb [signed-by=/etc/apt/trusted.gpg.d/playit.gpg] https://playit-cloud.github.io/ppa/data ./" | tee /etc/apt/sources.list.d/playit-cloud.list && \
  apt-get update && \
  apt-get -y install playit pufferpanel unzip && \
  pufferpanel user add --name admin --email admin@seen.is-a.dev --password admin --admin
WORKDIR etc/pufferpanel
EXPOSE 8080
