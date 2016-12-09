FROM openjdk:8-jdk

ENV HOME /home/jenkins
RUN groupadd -g 233 docker
RUN groupadd -g 10000 jenkins
RUN useradd -c "Jenkins user" -d $HOME -u 10000 -g 10000 -m jenkins
RUN usermod -a -G docker jenkins

RUN apt-get update && apt-get install -y sudo
RUN echo "jenkins ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/jenkins

USER jenkins
