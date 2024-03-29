# Container image that runs your code
FROM ubuntu:focal

RUN export DEBIAN_FRONTEND=noninteractive; \
    apt update \
    # && apt install -y software-properties-common \
    && apt install -y python3 python3-pip git locales locales-all git curl 
RUN curl -k -O https://bootstrap.pypa.io/get-pip.py ; \
    python3 get-pip.py
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
RUN python3 -m pip install antsibull-docs ansible sphinx_rtd_theme sphinx --no-cache-dir \
    && update-alternatives --install /usr/bin/python python /usr/bin/python3 1

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# # Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]