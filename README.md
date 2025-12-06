## Project Workflow & Tooling Overview

This project uses a modern Infrastructure-as-Code workflow built around Visual Studio Code, GitHub, and Terraform Cloud.  
Together, these tools create a fully automated pipeline for provisioning and managing AWS resources.

### How these tools work together

- **Visual Studio Code** is used to write and manage all Terraform configuration files (`.tf`).
- **GitHub** stores the entire project in a version-controlled repository, making every change traceable and recoverable.
- **Terraform Cloud** connects to GitHub and automatically:
  - detects updates to the repository
  - runs `terraform plan` and `terraform apply`
  - provisions the AWS resources required for each project stage

This workflow ensures that the environment is:

- consistent  
- repeatable  
- automated  
- aligned with real-world engineering practices  

### Why Terraform is used in this project

- Infrastructure is defined as code, not as manual console actions.
- Terraform keeps a **state file** to track existing resources and required changes.
- It enables a clean evolution from **Level 1 → Level 2 → Level 3**.
- Environments can be created, destroyed, and recreated reliably at any time.

---

## Pre-Work: Manual Infrastructure via AWS Management Console

Before writing Terraform, all infrastructure is first created manually in AWS to understand how the components work together.  
This includes:

- Creating the VPC, subnets, route tables, Internet Gateway, and Security Groups  
- Launching an EC2 instance manually  
- Deploying a static website using User Data  
- Installing the full LAMP stack and WordPress manually on EC2  
- Creating the final User Data script that automates the WordPress installation  

Once the manual environment works end-to-end, Terraform is used to rebuild the environment from scratch, fully automated.

---

## Project Levels

### Level 1 – Default Project

A foundational setup focused on deploying a single WordPress web server.

- Create an EC2 instance as a web server hosting WordPress (installed through User Data)
- Build all required AWS networking: VPC, subnets, route tables, security groups, Internet Gateway
- Use two Availability Zones with a public and private subnet
- Use a local MySQL/MariaDB database running on the EC2 instance

### Level 2 – Advanced Project

Introduce managed AWS database services.

- Add an Amazon RDS database for WordPress
- Modify the WordPress installation script to connect to RDS instead of local MariaDB
- Use Multi-AZ RDS instances inside private subnets

### Level 3 – Expert Project

Extend the architecture towards a production-style setup.

- Add a Bastion Host for secure administrative access
- Move WordPress servers into private subnets
- Add a NAT Gateway for outbound internet access from private subnets
- Add an Auto Scaling Group for WordPress instances
- Add an Application Load Balancer in front of the WordPress tier
