FROM openjdk:8-jdk

ENV HOME /home/jenkins
RUN groupadd -g 233 docker
RUN groupadd -g 10000 jenkins
RUN useradd -c "Jenkins user" -d $HOME -u 10000 -g 10000 -m jenkins
RUN usermod -a -G docker jenkins

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        sudo \
        build-essential \
        libssl-dev \
    && git clone https://github.com/AGWA/git-crypt.git /tmp/git-crypt \
    && cd /tmp/git-crypt \
    && make \
    && cp git-crypt /usr/local/bin/ \
    && cd / \
    && rm -rf /tmp/git-crypt \
    && apt-get -y purge build-essential \
    && apt-get -y autoremove \
    && rm -rf /var/lib/apt/lists/*
RUN echo "jenkins ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/jenkins

USER 10000

COPY entrypoint.sh /opt/bin/entrypoint.sh
