# CapstoneAWS  
AWS infrastructure with WordPress as a web server, Autoscaling & ALB  
Project Overview  

This capstone project culminates my AWS Cloud Engineer re/Start program.  
It is structured into three stages of increasing complexity, each expanding the infrastructure and introducing more advanced AWS services.

---

## Level 1 – Default Project

A foundational setup focused on deploying a single WordPress web server.

- Deploy an EC2 instance running WordPress via User Data  
- Create all required networking components (VPC, subnets, route tables, IGW, security groups)  
- Use two Availability Zones, each with public and private subnets  
- Use a local MySQL database running on the EC2 instance  

---

## Level 2 – Advanced Project

Introduce managed AWS database services.

- Add Amazon RDS for the WordPress database  
- Adjust the User Data script to point WordPress to RDS  
- Deploy a Multi-AZ RDS instance in private subnets  

---

## Level 3 – Expert Project

Expand the architecture into a secure, production-style environment.

- Add a Bastion Host for secure administrative access  
- Move WordPress servers into private subnets  
- Add a NAT Gateway to allow outbound traffic  
- Implement an Autoscaling Group for high availability  
- Add an Application Load Balancer to distribute traffic  

---
