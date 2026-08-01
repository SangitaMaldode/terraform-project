# 🚀 AWS Terraform Infrastructure Project

## 📌 Overview

This project demonstrates how to provision a complete AWS infrastructure using **Terraform Infrastructure as Code (IaC)**. It deploys a highly available web application architecture with networking, compute, storage, and load balancing components.

The infrastructure is fully automated, making it easy to create, modify, and destroy AWS resources in a repeatable and consistent manner.

---

## 🏗️ Architecture

The project provisions the following AWS resources:

- Amazon VPC
- Internet Gateway
- Public Route Table
- Two Public Subnets
- Route Table Associations
- Security Group
- Two EC2 Web Servers
- Apache Web Server installation using EC2 User Data
- Amazon S3 Bucket
- Application Load Balancer (ALB)
- Target Group
- Listener
- Target Group Attachments

```
                Internet
                    │
                    ▼
         Application Load Balancer
                    │
        ┌───────────┴───────────┐
        │                       │
        ▼                       ▼
   EC2 Web Server 1       EC2 Web Server 2
      Apache HTTP            Apache HTTP
        │                       │
        └──────────┬────────────┘
                   │
                 Amazon VPC
         ┌──────────────────────┐
         │ Public Subnet 1      │
         │ Public Subnet 2      │
         └──────────────────────┘
                   │
            Internet Gateway

               Amazon S3
```

---

## ⚙️ Technologies Used

- Terraform
- AWS EC2
- Amazon VPC
- Internet Gateway
- Route Tables
- Security Groups
- Application Load Balancer (ALB)
- Target Groups
- Amazon S3
- Ubuntu
- Apache HTTP Server
- Bash (User Data)

---

## 📂 Project Structure

```
terraform-project/
│
├── main.tf
├── provider.tf
├── variable.tf
├── userdata1.sh
├── userdata2.sh
├── .gitignore
└── README.md
```

---

## 🚀 Features

- Infrastructure as Code with Terraform
- Automated EC2 provisioning
- Automated Apache installation using User Data
- Public web servers
- Application Load Balancer
- HTTP traffic distribution
- S3 bucket creation
- Secure networking with VPC and Security Groups
- Easily reproducible infrastructure

---

## ▶️ Getting Started

### Clone the repository

```bash
git clone https://github.com/SangitaMaldode/terraform-project.git
cd terraform-project
```

### Initialize Terraform

```bash
terraform init
```

### Validate configuration

```bash
terraform validate
```

### Review execution plan

```bash
terraform plan
```

### Deploy infrastructure

```bash
terraform apply
```

### Destroy infrastructure

```bash
terraform destroy
```

---

## 🔒 Security Notes

This repository intentionally excludes:

- Terraform state files
- Private SSH keys
- Sensitive variable files

The following are ignored through `.gitignore`:

```
terraform.tfstate
terraform.tfstate.backup
.terraform/
*.pem
*.tfvars
```

---

## 📖 What I Learned

Through this project, I gained hands-on experience with:

- Designing AWS networking using VPCs and subnets
- Managing Security Groups and routing
- Provisioning EC2 instances using Terraform
- Automating server configuration with EC2 User Data
- Deploying Apache web servers
- Creating and managing S3 buckets
- Building an Application Load Balancer
- Registering EC2 instances with Target Groups
- Troubleshooting networking, security groups, routing, and load balancer health checks
- Applying Infrastructure as Code (IaC) best practices

---

## 📸 Demo

You can add screenshots such as:

- Terraform Apply Output
- AWS Console Resources
- EC2 Instances
- VPC Architecture
- Application Load Balancer
- Successful Web Page
- S3 Bucket

---

## 🤝 Contributions

Suggestions, improvements, and feedback are always welcome. Feel free to fork the repository, open an issue, or submit a pull request.

---

## 👩‍💻 Author

**Sangita Maldode**

Cloud | DevOps | DevSecOps | AWS | Terraform | Kubernetes | Docker | CI/CD

GitHub: https://github.com/SangitaMaldode

---

⭐ If you found this project useful, consider giving it a **Star** on GitHub!




