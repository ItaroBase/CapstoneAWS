# CapstoneAWS

AWS infrastructure with WordPress as a web server, Autoscaling & ALB  

**Project Overview**

This capstone project marks the final practical challenge in my AWS Cloud Engineer re/Start program.

It progresses through three stages of growing complexity, each adding new AWS components and architectural depth.
By Stage 2, the system evolves into a multi-AZ, scalable, and secure infrastructure for hosting WordPress.

## Project Workflow & Tooling Overview

This project uses a modern Infrastructure-as-Code workflow built around **Visual Studio Code**, **GitHub**, and **Terraform Cloud**.  
Together, these tools create a fully automated pipeline for provisioning and managing AWS resources.

### How these tools work together

- **Visual Studio Code** is used to write and manage all Terraform configuration files (`.tf`).
- **GitHub** stores the entire project in a version-controlled repository, making every change traceable and recoverable.
- **Terraform Cloud** connects to GitHub and automatically:
  - detects updates to the repository,
  - runs `terraform plan` and `terraform apply`,
  - and provisions all AWS resources for each project stage.

This workflow ensures that the environment is:

- consistent  
- repeatable  
- automated  
- aligned with real engineering practices  

### Why Terraform is used in this project

- Infrastructure is defined **as code**, not as manual console steps.
- Terraform maintains a **state file** to track resources and required changes.
- It provides a clean progression from **Level 1 → Level 2 → Level 3**.
- The entire environment can be created, destroyed, and recreated at any time.

---

## Pre-Work: Manual Infrastructure via AWS Management Console

Before starting Level 1, all infrastructure is first created manually using the AWS Management Console and the AWS CLI.  
This helps build a deep understanding of how each component interacts.

This includes:

- Creating the VPC, subnets, route tables, Internet Gateway, and Security Groups  
- Launching an EC2 instance manually  
- Deploying a static webpage using User Data  
- Installing the LAMP stack and WordPress manually on EC2  
- Developing the final User Data script that automates the WordPress installation  

Once the manual environment works end-to-end, Terraform is used to rebuild everything fully automatically.

---

## Project Levels

### **Level 1 – Default Project**

A foundational setup focused on deploying a single WordPress web server.

- Deploy an EC2 instance running WordPress via User Data  
- Create all required networking components (VPC, subnets, route tables, IGW, security groups)  
- Use two Availability Zones, each with public and private subnets  
- Use a local MySQL/MariaDB database running on the EC2 instance  

---

### **Level 2 – Advanced Project**

Introduce managed AWS database services.

- Add Amazon RDS for the WordPress database  
- Adjust the User Data script so WordPress connects to RDS  
- Deploy a Multi-AZ RDS instance inside private subnets  

---

### **Level 3 – Expert Project**

Extend the architecture into a production-style environment.

- Add a Bastion Host for secure admin access  
- Move WordPress servers into private subnets  
- Add a NAT Gateway  
- Add an Auto Scaling Group  
- Add an Application Load Balancer  

---
