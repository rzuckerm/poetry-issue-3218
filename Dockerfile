FROM ubuntu:18.04
RUN apt-get update && \
    apt-get install -y python2.7 python3-pip locales
RUN python3 -m pip install -U pip && \
    python3 -m pip install poetry
RUN locale-gen en_US.utf8
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENTRYPOINT ["bash"]
