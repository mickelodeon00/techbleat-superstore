# TechBleat Superstore Infrastructure

Automated AWS deployment of a web server + PostgreSQL database using Terraform.

## Prerequisites

- AWS account
- Terraform installed
- AWS CLI configured (`aws configure`)
- AWS key pair created

## Setup

1. **Navigate to the terraform directory:**

```bash
   cd techbleat-superstore/terraform
```

2. **Add your credentials**

   Create `dev.tfvars`:

```hcl
   db_username   = "dbadmin"
   db_password   = "YourPassword123!"
   key_pair_name = "your-aws-key-name"
```

## Using Terraform

**All commands must be run from the `terraform` directory.**

**Initialize (first time only):**

```bash
terraform init
```

**Preview changes:**

```bash
terraform plan -var-file="dev.tfvars"
```

**Deploy infrastructure:**

```bash
terraform apply -var-file="dev.tfvars"
```

**Remove everything:**

```bash
terraform destroy -var-file="dev.tfvars"
```

**What gets created:** EC2 web server, PostgreSQL database, 2 security groups (4 resources total)

## After Deployment

Check the outputs for your server IP and database endpoint. Always destroy resources when done to avoid charges.
