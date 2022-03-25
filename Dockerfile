# Container image that runs your code
FROM python:3.7-slim

RUN python3 -m pip install antsibull ansible sphinx_rtd_theme --no-cache-dir
# RUN yum -y install python3-pip
# RUN pip install --upgrade pip \ 
#     && pip install ansible


# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]