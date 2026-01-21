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

echo "Installing unzip package"
sudo apt install unzip -y

echo "Extracting Tomcat..."
unzip apache-tomcat-9.0.113.zip

echo "Going into the tomcat directory"
cd apache-tomcat-9.0.113

echo "Going into the tomcat conf directory"
cd conf

echo "Entering and editing the tomcat Port No. from 8080 to 9090"
vi server.xml

echo "Going one step back in directory path"
cd ..

echo "Going into the bin directory"
cd bin

echo "Giving owner read, write and execute access to .sh files"
chmod 700 *.sh

echo "Starting Tomcat..."
./startup.sh

echo "Going one step back in directory"
cd ..

echo "Going to the webapps directory"
cd webapps

echo "Going to the sudoers file and adding 1 line for nopasswd and all access to the jenkins"
visudo

echo "Restart Jenkins again"
service jenkins restart

echo "Tomcat and Jenkins setup completed successfully!"