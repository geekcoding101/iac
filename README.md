# 🚀 Terraform AWS Starter Kit

This repo contains the Terraform code that powers the [Mastering Terraform with AWS Guide (Part 1)](https://geekcoding101.com/devops/terraform/1-terraform-with-aws-iam-ec2/).

You’ll go from zero to a running EC2 instance with a custom VPC and IAM roles – all provisioned through clean, modular Terraform.

> ✅ Perfect for beginners getting hands-on with AWS + Terraform  
> ⚙️ Infrastructure-as-Code done right – readable, reusable, and production-minded  
> 🔐 Includes IAM role setup for secure EC2 access

---

## 📦 What’s Inside

- Custom **VPC** with public subnet
- **Internet Gateway** & route table setup
- **Security Group** with SSH access
- Launch an **EC2 instance** (Amazon Linux 2)

---

## 🚀 Quick Start

### ✅ Prerequisites

- [Terraform CLI](https://www.terraform.io/downloads.html)
- AWS credentials configured
- An AWS account with sufficient IAM permissions

---

### 🛠️ Setup

Clone the repo:

```bash
git clone https://github.com/your-username/terraform-aws-vpc-iam-ec2.git
cd terraform-aws-vpc-iam-ec2
```

Initialize Terraform:

```
terraform init
```

Preview the plan:

```
terraform plan
```

Apply the changes:

```
terraform apply
```

## Related Blog Post

This repo is part of the blog series:

👉 [Mastering Terraform with AWS Guide (Part 1)](https://geekcoding101.com/devops/terraform/1-terraform-with-aws-iam-ec2/)

Includes detailed explanations, Terraform tips, and stories from the cloud trenches.

