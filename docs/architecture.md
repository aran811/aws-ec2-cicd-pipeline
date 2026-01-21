# CI/CD Architecture – AWS EC2 with Jenkins

This document explains the CI/CD architecture used in this project and corresponds to the architecture diagram stored in `docs/architecture.png`.

---

## 📌 Architecture Overview

This project implements a **Jenkins-based CI/CD pipeline** that automates the build, test, and deployment of an application to **Apache Tomcat running on AWS EC2**.

The application source code and CI/CD pipeline code are maintained in **separate GitHub repositories**, following industry-standard DevOps best practices.

---

## 🧱 Architecture Components

### 1. Developer
- Developers write and modify application source code
- Code is pushed to the **Application GitHub Repository**

---

### 2. GitHub – Application Repository
- Contains only the application source code
- No CI/CD logic is stored here
- A GitHub webhook triggers Jenkins when code is pushed

---

### 3. GitHub – CI/CD Pipeline Repository
- Contains:
  - `Jenkinsfile`
  - Shell scripts for setup and deployment
  - Documentation and diagrams
- Jenkins uses this repository to define the pipeline (**Pipeline as Code**)

---

### 4. Jenkins Server
- Jenkins is installed on an AWS EC2 instance
- Orchestrates the CI/CD pipeline stages:
  - Checkout
  - Build
  - Test
  - Package
  - Deploy

---

### 5. Build & Test (Maven)
- Jenkins uses Maven to:
  - Download dependencies
  - Compile the application
  - Run unit tests
- Pipeline execution stops if tests fail

---

### 6. Package (WAR File)
- Maven packages the application into a WAR file
- WAR file is the deployable artifact used for deployment

---

### 7. Apache Tomcat
- Installed on AWS EC2
- Jenkins deploys the WAR file into Tomcat’s `webapps` directory
- Deployment is fully automated

---

### 8. AWS EC2
- Provides the compute infrastructure for:
  - Jenkins
  - Tomcat
- Ensures scalability and availability

---

### 9. End Users
- Users access the application using the EC2 public IP or domain name
- Application is available after a successful pipeline run

---

## 🔄 Architecture Flow

```text
Developer
   ↓
GitHub (Application Repository)
   ↓
Jenkins (CI/CD Pipeline Repository)
   ↓
Maven Build & Test
   ↓
WAR Packaging
   ↓
Apache Tomcat
   ↓
AWS EC2
   ↓
End Users
