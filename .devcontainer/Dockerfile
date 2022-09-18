FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get -y install git curl unzip groff software-properties-common

ARG PYTHON_VERSION=3.9
RUN add-apt-repository ppa:deadsnakes/ppa \
    && apt-get update \
    && apt-get -y install python${PYTHON_VERSION}-venv python${PYTHON_VERSION}-dev

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install
RUN curl -fsSL https://deb.nodesource.com/setup_16.17 | bash - \
    && apt-get install -y nodejs npm
RUN npm install -g aws-cdk

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID
RUN groupadd --gid ${USER_GID} ${USERNAME} \
    && useradd --uid ${USER_UID} --gid ${USER_GID} --create-home --shell /bin/bash ${USERNAME} 

USER ${USERNAME}
RUN curl -sSL https://install.python-poetry.org | python${PYTHON_VERSION} -
