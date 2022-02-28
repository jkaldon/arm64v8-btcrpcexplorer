FROM debian:buster-slim as btcrpcexplorer

ARG BTCRPCEXPLORER_BASE_URL=https://github.com/janoside/btc-rpc-explorer.git
ARG BTCRPCEXPLORER_BRANCH=v3.3.0

ENV DEBIAN_FRONTEND=noninteractive

RUN set -ex && \
  apt-get update && \
  apt-get install -y \
    git \
    curl \
    procps \
    coreutils && \
  useradd -d /home/btcrpcexplorer -m -s /usr/sbin/nologin btcrpcexplorer && \
  curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \
  apt-get install -y nodejs

USER btcrpcexplorer

RUN set -ex && \
  cd /home/btcrpcexplorer && \
  git clone --branch "${BTCRPCEXPLORER_BRANCH}" "${BTCRPCEXPLORER_BASE_URL}" ./btc-rpc-explorer && \
  cd btc-rpc-explorer && \
  npm install

WORKDIR /home/btcrpcexplorer/btc-rpc-explorer

CMD [ "npm", "run", "start" ]
