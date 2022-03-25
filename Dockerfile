# Container image that runs your code
FROM centos:7

RUN echo "sslverify=false" >> /etc/yum.conf
RUN yum -y install python3 python3-pip python3-wheel ansible
RUN pip3 install antsibull

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]