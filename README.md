# Threat Composer — Infrastructure as Code (IaC) Deployment
**Threat Composer** is an open-source threat-modeling tool developed by **AWS Labs** that helps teams identify, document and visualise potential security threats to cloud or system architectures. It is a single-page web application (built with React + Cloudscape UI) that runs fully in the browser. The default deployment does not include a backend/API — all data (system description, diagrams, assumptions, threats, mitigations, etc.) is stored in browser local storage.

🧩 Original Tool: [Threat Composer Tool](https://awslabs.github.io/threat-composer/workspaces/default/dashboard)

🌍 Live Application: [www.devopsproject.org](https://www.devopsproject.org)

📝 Medium Blog: [Threat Composer Medium Blog](https://medium.com/@sajina.tamang99/threat-composer-4b606d5163c0)

## Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Tools & Technologies](#tools--technologies)
- [Project Structure](#project-structure)
- [Architecture Diagram](#architecture-diagram)
- [Local Setup](#local-setup)
- [Demo](#demo)
- [Screenshots](#screenshots)

## 1. Overview
Deployed the Threat Composer app on AWS using a secure, scalable, and automated DevOps pipeline. Infrastructure was provisioned with **Terraform**, containerized with **Docker**, stored in **ECR**, and deployed to **ECS Fargate**. A **GitHub Actions CI/CD pipeline** automated build, **trivy security scan**, and deployment. **Route 53** and **ACM** ensured domain management and HTTPS for a cost-efficient, reliable setup.
	
## 2. Prerequisites
Before running this project, ensure the following are available
- ✅ AWS Account with IAM User (programmatic access)
- ✅ AWS CLI configured (aws configure in local system)
- ✅ Terraform installed (via VS Code)
- ✅ GitHub account (fork & clone this repo)
- ✅ Git installed (via VS Code)

## 3. Tools & Technologies

|Category|Tool|Purpose| 
|-----------|----------------|----------|
| IaC (Infrastructure as Code) |Terraform |Automate creation of AWS resources |
| Cloud Provider | AWS | Infrastructure hosting (Fargate, RDS, Route53, ALB, ACM, etc.) |
| Compute | AWS ECS Fargate|Run containerized Node.js application |
| Networking|AWS VPC, Subnets, Security Groups|Secure network segmentation |
| Load Balancing|AWS Application Load Balancer (ALB)|Distribute incoming traffic |
| DNS Management|AWS Route53|Domain management & routing |
| SSL/TLS Certificates|AWS ACM|Secure HTTPS access |
| Container Registry|AWS ECR|Store and version Docker images |
| CI/CD|GitHub Actions|Continuous integration & deployment |
| Security Scanning|Trivy|Container image vulnerability scanning |
| Version Control|GitHub|Source code hosting and collaboration |
| IDE|Visual Studio Code|Development and IaC editing environment |

## 4. Project Structure

```
threat-composer-app/
├── app/                             # Frontend / application source code
│   ├── src/                         # (React or Node app source files)
│   ├── public/                      # Static assets
│   ├── package.json                 # App dependencies and scripts
│   └── ...                          # Other app-related files
│
├── tf_infra/                        # Terraform infrastructure code
│   ├── main.tf                      # Root Terraform configuration
│   ├── variables.tf                 # Variable definitions
│   ├── outputs.tf                   # Output definitions
│   ├── terraform.tf                 # Backend / provider config
│   └── modules/                     # Reusable Terraform modules
│       ├── acm/                     # SSL certificate (ACM) setup
│       ├── dns/                     # Route53 DNS configuration
│       ├── vpc/                     # VPC and networking resources
│       ├── alb/                     # Application Load Balancer
│       ├── ecs/                     # ECS cluster and services
│       └── ecr/                     # Elastic Container Registry
│
├── .github/
│   └── workflows/                   # GitHub Actions CI/CD pipelines
│       ├── main_deploy.yml          # CI/CD pipeline (Terraform + Docker deploy)
│       └── destroy.yml              # Manual teardown (Docker + Terraform destroy)
│
├── .gitignore                       # Git ignore configuration
└── README.md                        # Project documentation
```

## 5. Architecture diagram
![Architecture](images/Architecture.diagram.png)

## 6. Local Setup

Clone this repository and navigate into the app directory.
You can run the application either with npm (for development) or with Docker (for an isolated runtime).

Using npm: Runs the app in development mode at http://localhost:3000.
```
npm install
npm start
```
Using Docker: If you have Docker installed, you can run the app in a container (no Node.js setup needed). Access it at http://localhost:8080.
```
docker build -t threat-composer-app ./app
docker run -p 8080:80 threat-composer-app
```

## 6. Demo

https://github.com/user-attachments/assets/00ed1d24-1efc-4875-83b3-ee68837f5303

## 7. Screenshots

![alt text](./images/threat-composer-image.JPG)

![alt text](./images/Terraform_Resources_Summary.JPG)

![alt text](./images/Terraform_Resources_Summary_Complete.JPG)