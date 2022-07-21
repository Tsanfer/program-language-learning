# [Choice] Ubuntu version (use ubuntu-22.04 or ubuntu-18.04 on local arm64/Apple Silicon): ubuntu-22.04, ubuntu-20.04, ubuntu-18.04
ARG VARIANT=ubuntu-20.04
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>
RUN apt-get -y update \
  && apt-get -y install \
    neofetch \
    lua5.4 \
    make \
  && wget https://github.com/ClementTsang/bottom/releases/download/0.6.8/bottom_0.6.8_amd64.deb -NP ~ \
  && sudo dpkg -i ~/bottom_0.6.8_amd64.deb
