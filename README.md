Capstone Project Overview

This capstone project culminates my AWS Cloud Engineer re/Start program.
It is structured into three stages of increasing complexity, each expanding the infrastructure and introducing more advanced AWS services.

⸻

🔧 Project Workflow & Tooling Overview

This project uses a modern Infrastructure-as-Code workflow built around Visual Studio Code, GitHub, and Terraform Cloud.
Together, these tools create a fully automated pipeline for provisioning and managing AWS resources.

How these tools work together
	•	Visual Studio Code is used to write and manage all Terraform configuration files (.tf).
	•	GitHub stores the entire project in a version-controlled repository, making every change traceable and recoverable.
	•	Terraform Cloud connects to GitHub and automatically:
	•	detects updates to the repository,
	•	runs Terraform plan and apply,
	•	and provisions the AWS resources required for each project stage.
	•	This workflow ensures that the environment is:
	•	consistent
	•	repeatable
	•	automated
	•	and production-aligned, following real engineering practices.

Why Terraform is used in this project
	•	Infrastructure is defined as code, not manual console actions.
	•	Terraform keeps a state file to track existing resources and required changes.
	•	It enables a clean evolution from Level 1 → Level 2 → Level 3.
	•	Environments can be created, destroyed, and recreated reliably at any time.

⸻

## Pre-Work: Manual Infrastructure via AWS Management Console

Before writing Terraform, all infrastructure is first created manually in AWS to understand how the components work together.
This includes:
	•	Creating the VPC, subnets, route tables, Internet Gateway, and Security Groups
	•	Launching EC2 manually
	•	Deploying a static website using user-data
	•	Installing the full LAMP stack + WordPress manually on EC2
	•	Creating the final user-data script that automates the WordPress installation

Once the manual environment works end-to-end, Terraform is used to rebuild the environment from scratch, fully automated.

⸻

Project Levels

Level 1 — Default Project
	•	Create an EC2 machine as a web server hosting WordPress (installed through user-data)
	•	Build all required AWS networking: VPC, subnets, route tables, security groups, IGW
	•	Use 2 Availability Zones with a public and private subnet
	•	Use a local MySQL/MariaDB database running on the EC2 instance

Level 2 — Advanced Project
	•	Add an Amazon RDS database
	•	Modify the WordPress installation script to connect to RDS instead of local MariaDB
	•	Use Multi-AZ RDS inside private subnets

Level 3 — Expert Project
	•	Add a Bastion Host for secure access
	•	Move WordPress servers into private subnets
	•	Add a NAT Gateway
	•	Add an Auto Scaling Group
	•	Add an Application Load Balancer
