FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu
ARG USER_ID=1000
ARG USER_GID=1000
ARG DIALOUT_GID=492
ARG USERNAME=vscode

RUN apt-get update \
    && apt-get -qqy install \
    bc \
    sudo \
    build-essential \
    ca-certificates \
    clang \
    curl \
    gcc \
    git \
    python3 \
    python3-dev \
    python3-distutils \
    python3-pip \
    python3-venv \
    python3-setuptools \
    srecord \
    udev \
    xz-utils \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*
RUN (getent group ${USER_GID} || groupadd -g ${USER_GID} ${USERNAME}) \
    && (getent group ${DIALOUT_GID} || groupadd -r -g $DIALOUT_GID dialout_host) \
    && (getent passwd ${USER_ID} || useradd -u ${USER_ID} -g ${USER_GID} -m ${USERNAME}) \
    && usermod -aG ${DIALOUT_GID} ${USERNAME}

RUN curl -fLo /etc/udev/rules.d/99-platformio-udev.rules --create-dirs https://raw.githubusercontent.com/platformio/platformio-core/develop/platformio/assets/system/99-platformio-udev.rules

USER $USERNAME

RUN python3 -c "$(curl -fsSL https://raw.githubusercontent.com/platformio/platformio/develop/scripts/get-platformio.py)"