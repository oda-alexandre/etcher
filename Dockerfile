FROM debian:buster-slim

LABEL authors https://www.oda-alexandre.com

ENV USER etcher
ENV HOME /home/${USER}
ENV DEBIAN_FRONTEND noninteractive

RUN echo -e '\033[36;1m ******* INSTALL PACKAGES ******** \033[0m' && \
  apt-get update && apt-get install -y --no-install-recommends \
  sudo \
  ca-certificates \
  usbutils \
  gnupg2 && \
  rm -rf /var/lib/apt/lists/*

RUN echo -e '\033[36;1m ******* CONFIG SOURCES AND KEY ******** \033[0m' && \
  echo 'deb https://deb.etcher.io stable etcher' >> /etc/apt/sources.list && \
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 379CE192D401AB61

RUN echo -e '\033[36;1m ******* INSTALL APP ******** \033[0m' && \
  apt-get update && apt-get install -y --no-install-recommends \
  etcher-electron

RUN echo -e '\033[36;1m ******* ADD USER ******** \033[0m' && \
  useradd -d ${HOME} -m ${USER} && \
  passwd -d ${USER} && \
  adduser ${USER} sudo

RUN echo -e '\033[36;1m ******* SELECT USER ******** \033[0m'
USER ${USER}

RUN echo -e '\033[36;1m ******* SELECT WORKING SPACE ******** \033[0m'
WORKDIR ${HOME}

RUN echo -e '\033[36;1m ******* CONTAINER START COMMAND ******** \033[0m'
CMD etcher-electron \