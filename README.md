# Terraform AWS EC2 Instance with Nginx Setup

This Terraform configuration provisions an AWS EC2 instance with **Nginx** installed and configured, along with a security group that allows HTTP, HTTPS, SSH, and custom ports access.

---

## Overview

- **Key Pair:** Creates an AWS key pair from your existing public SSH key.
- **Networking:** Uses the default VPC and creates a security group with appropriate ingress and egress rules.
- **Instance:** Launches an EC2 instance using a specified Ubuntu AMI.
- **Nginx:** Installs and starts Nginx automatically via `user_data` script on boot.
- **Security:** Opens ports 22 (SSH), 80 (HTTP), 443 (HTTPS), and custom ports (8000, 8080).

---

## Prerequisites

- [Terraform v1.8.4+](https://www.terraform.io/downloads.html)
- AWS CLI configured with appropriate credentials and permissions
- Existing SSH public key (`id_rsa.pub`) located at the specified path (update if needed)
- AWS account with permission to create EC2 instances, security groups, and key pairs

---
