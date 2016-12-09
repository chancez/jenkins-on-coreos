#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
sudo mkdir -p /opt/bin

sudo cp "$DIR/rkt-run-java" /opt/bin/java
sudo chmod 500 /opt/bin/java
sudo chown jenkins:root /opt/bin/java

# Add jenkins to rkt groups
sudo usermod -a -G rkt-admin jenkins
sudo usermod -a -G rkt jenkins

# put java in path for non-interactive sessions
rm -f /home/jenkins/.bashrc
echo 'export PATH=$PATH:/opt/bin/' > /home/jenkins/.bashrc
