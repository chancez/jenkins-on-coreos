#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
sudo mkdir -p /opt/bin /opt/jenkins

sudo cp "$DIR/rkt-run-java" /opt/bin/java
sudo chmod 500 /opt/bin/java
sudo chown jenkins:root /opt/bin/java

# Add jenkins to rkt groups
sudo usermod -a -G rkt-admin jenkins
sudo usermod -a -G rkt jenkins
# add jenkins to docker group
sudo usermod -a -G docker jenkins

# put java in path for non-interactive sessions
rm -f /home/jenkins/.bashrc
echo 'export PATH=$PATH:/opt/bin/' > /home/jenkins/.bashrc
