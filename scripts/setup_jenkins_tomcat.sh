#!/bin/bash

# Exit immediately if a command fails
set -e

echo "Updating system..."
sudo apt update -y

echo "Installing Java 17..."
sudo apt install openjdk-17-jdk -y

echo "Installing Maven..."
sudo apt install maven -y

echo "Adding Jenkins repository..."
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key \
  | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo "Configuring Jenkins APT source..."
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" \
  | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

echo "Updating package list..."
sudo apt update -y

echo "Installing Jenkins..."
sudo apt install jenkins -y

echo "Starting Jenkins service..."
sudo systemctl start jenkins
sudo systemctl enable jenkins

echo "Jenkins initial admin password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

echo "Installing unzip..."
sudo apt install unzip -y

echo "Downloading Apache Tomcat 9..."
wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.113/bin/apache-tomcat-9.0.113.zip

echo "Extracting Tomcat..."
unzip apache-tomcat-9.0.113.zip

echo "Setting execute permissions on Tomcat scripts..."
cd apache-tomcat-9.0.113/bin
chmod 700 *.sh

echo "Starting Tomcat..."
./startup.sh

echo "Tomcat and Jenkins setup completed successfully!"