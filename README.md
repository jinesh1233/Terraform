# Terraform & AWS Cloud Infrastructure Projects

A hands-on collection of Infrastructure as Code (IaC) projects using **Terraform and Amazon Web Services (AWS)**.

This repository contains practical implementations of AWS infrastructure provisioning, remote state management, DynamoDB state locking, Terraform Workspaces, reusable modules, and Amazon EKS.

The primary objective is to understand how cloud infrastructure can be provisioned, managed, and automated using Terraform.

## Technologies Used

- Terraform
- Amazon Web Services (AWS)
- Amazon EC2
- Amazon VPC
- Amazon S3
- Amazon DynamoDB
- Amazon EKS
- Git & GitHub
- Linux / Shell Scripting

## Repository Structure

```text
Terraform/
│
├── Modules/
│   └── infra-app/
│       ├── .terraform.lock.hcl
│       ├── main.tf
│       ├── provider.tf
│       ├── terra-key.pub
│       ├── terraform.tf
│       └── vpc.tf
│
├── Remote-infra/
│   ├── .terraform.lock.hcl
│   ├── Remote-infra.code-workspace
│   ├── dynamodb.tf
│   ├── providers.tf
│   ├── s3.tf
│   └── terraform.tf
│
├── Terraform-eks/
│   ├── .terraform.lock.hcl
│   ├── eks.tf
│   ├── locals.tf
│   ├── provider.tf
│   ├── terraform.tf
│   └── vpc.tf
│
├── Terraform-prep/
│   ├── .terraform.lock.hcl
│   ├── ec2.tf
│   ├── install_nginx.sh
│   ├── output.tf
│   ├── provider.tf
│   ├── terra-ec2-key.pub
│   ├── terraform.tf
│   └── variable.tf
│
├── .gitignore
└── README.md
```

## Projects & Implementations

### 1. Terraform Preparation – AWS EC2

**Folder:** `Terraform-prep`

Implemented AWS EC2 infrastructure using Terraform.

Key concepts:
- EC2 instance provisioning.
- AWS provider configuration.
- Terraform variables and outputs.
- Shell scripting for Nginx installation.
- Terraform initialization, planning and deployment.
- Infrastructure configuration management.

### 2. Remote Infrastructure – S3 & DynamoDB

**Folder:** `Remote-infra`

Implemented remote Terraform state management using AWS services.

Key concepts:
- Amazon S3 bucket for remote Terraform state storage.
- DynamoDB table for state locking.
- LockID as the DynamoDB partition key.
- Remote backend configuration.
- Centralized state management.
- Prevention of concurrent state modifications through locking.

### 3. Terraform Modules – Reusable Infrastructure

**Folder:** `Modules/infra-app`

Worked on organizing Terraform configurations into a modular structure.

Key concepts:
- Terraform module organization.
- Infrastructure configuration.
- Provider management.
- VPC-related configuration.
- Reusability and maintainability of Terraform code.

### 4. Terraform EKS – Kubernetes Infrastructure

**Folder:** `Terraform-eks`

Worked on provisioning Kubernetes infrastructure using Amazon Elastic Kubernetes Service.

Key concepts:
- Amazon EKS cluster configuration.
- VPC infrastructure.
- Terraform locals.
- AWS provider configuration.
- Kubernetes infrastructure provisioning.

## Multi-Environment Infrastructure Management

Implemented three separate Terraform Workspaces to manage different environments using Terraform.

| Workspace | Environment |
|---|---|
| `dev` | Development |
| `staging` | Staging |
| `prod` | Production |

AWS resources managed across these environments:

- Amazon VPC
- Amazon EC2
- Amazon S3

The same Terraform configuration can be used with separate workspace states to manage different environments.

### Terraform Workspace Commands

Create workspaces:

```bash
terraform workspace new dev
terraform workspace new staging
terraform workspace new prod
```

List available workspaces:

```bash
terraform workspace list
```

Switch between environments:

```bash
terraform workspace select dev
terraform workspace select staging
terraform workspace select prod
```

Check current workspace:

```bash
terraform workspace show
```

## Terraform Workflow

```text
Terraform Configuration
          |
          v
     terraform init
          |
          v
   terraform validate
          |
          v
     terraform plan
          |
          v
    terraform apply
          |
          v
   AWS Infrastructure
```

## Prerequisites

Before running these projects, install:

- Terraform CLI
- AWS CLI
- Git
- AWS Account
- Configured AWS credentials
- Appropriate IAM permissions

## Getting Started

### 1. Clone Repository

```bash
git clone https://github.com/jinesh1233/Terraform.git
```

### 2. Navigate to the Required Project

Example:

```bash
cd Terraform/Terraform-prep
```

### 3. Initialize Terraform

```bash
terraform init
```

### 4. Validate Configuration

```bash
terraform validate
```

### 5. Review Execution Plan

```bash
terraform plan
```

### 6. Apply Infrastructure

```bash
terraform apply
```

### 7. Destroy Infrastructure

```bash
terraform destroy
```

## Security & Best Practices

- Exclude Terraform state files from version control.
- Never commit private SSH keys or AWS credentials.
- Use `.gitignore` to exclude sensitive and unnecessary files.
- Use remote state management for centralized state storage.
- Configure state locking to prevent concurrent modifications.
- Follow the principle of least privilege for IAM permissions.
- Review Terraform plans before applying infrastructure changes.

## Learning Outcomes

Through these hands-on projects, I gained practical experience in:

- Infrastructure as Code using Terraform.
- AWS infrastructure provisioning.
- EC2 and VPC configuration.
- S3 remote backend implementation.
- DynamoDB state locking using LockID.
- Terraform Workspaces for Dev, Staging and Production.
- Terraform modules and reusable configurations.
- Amazon EKS infrastructure.
- Infrastructure automation and version control.

## Author

**Jinesh Kumar**

GitHub: [@jinesh1233](https://github.com/jinesh1233)

Repository: [Terraform – AWS Infrastructure Projects](https://github.com/jinesh1233/Terraform)

---

*This repository represents my hands-on learning and practical implementation of Terraform and AWS cloud infrastructure, focusing on automation, remote state management, and multi-environment deployments.*

**Technologies:** Terraform | AWS | EC2 | VPC | S3 | DynamoDB | EKS | Git | GitHub
