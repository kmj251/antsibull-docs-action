# Container image that runs your code
FROM ubuntu:bionic

RUN apt update \
    # && apt install -y software-properties-common \
    && apt install -y python-is-python3 python3 python3-pip git locales locales-all git
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
RUN python3 -m pip install antsibull ansible sphinx_rtd_theme --no-cache-dir

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# # Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]