# AWS EC2 CI/CD Pipeline using Jenkins

This repository contains **CI/CD pipeline automation code** implemented using **Jenkins** for deploying applications to **AWS EC2**.  
The application source code is hosted in a **separate GitHub repository**, while this repo focuses only on **pipeline and infrastructure automation**.

---

## 📌 Project Overview

The CI/CD pipeline automates the following stages:

1. Source code checkout from application repository
2. Build and compilation using Maven
3. Unit testing
4. Packaging (WAR file)
5. Deployment to Apache Tomcat running on AWS EC2

This project follows **Pipeline as Code** and **Separation of Concerns** best practices.

---

## 🧰 Tools & Technologies

- **Jenkins** – CI/CD automation
- **GitHub** – Source control
- **AWS EC2** – Deployment environment
- **Apache Tomcat** – Application server
- **Maven** – Build and dependency management
- **Shell Scripting (Bash)** – Environment setup and deployment

---

## 📂 Repository Structure

```text
aws-ec2-cicd-pipeline/
├── Jenkinsfile
├── scripts/
│   └── setup_jenkins_tomcat.sh
├── docs/
│   └── architecture.png
├── README.md
