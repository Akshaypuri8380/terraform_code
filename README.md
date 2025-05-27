# Terraform AWS EC2 Instance with Nginx Setup

This Terraform configuration provisions an AWS EC2 instance running Ubuntu with **Nginx** installed and configured automatically. It also creates a security group that opens ports 22 (SSH), 80 (HTTP), 443 (HTTPS), 8000, and 8080.

---

## Features

- Creates an AWS key pair from your existing SSH public key.
- Uses the default VPC and creates a security group with multiple ingress rules.
- Launches an EC2 instance with the specified AMI and instance type.
- Installs and starts Nginx on instance boot via a user data script.
- Opens required ports for web and SSH access.

---

## Prerequisites

- Terraform v1.8.4 or later installed ([Install Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli))
- AWS CLI configured with your AWS credentials ([Setup AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html))
- SSH key pair already generated (public key at `C:/Users/ASUS/.ssh/id_rsa.pub` or update path accordingly)
- AWS account with permission to create EC2, key pairs, security groups, and related resources

---

## Terraform Configuration Details

The main resources created are:

- **aws_key_pair**: Uploads your local public key to AWS.
- **aws_default_vpc**: Uses the default VPC.
- **aws_security_group**: Defines ingress rules for ports 22, 80, 443, 8000, 8080 and allows all outbound traffic.
- **aws_instance**: Launches an EC2 instance using the Ubuntu AMI `ami-0e35ddab05955cf57` in the `us-east-1` region with your key pair and security group. Installs Nginx via `user_data`.

---

## Commands and Workflow

### 1. Clone or create your Terraform project directory

git clone https://github.com/Akshaypuri8380/terraform_code.git
cd terraform_code

**1.Initialize Terraform**
terraform init

**2.Validate Terraform configuration**
terraform validate

**4. Generate and review an execution plan**
terraform plan 

**6. Apply Terraform configuration to create resources**
terraform apply -auto-approve

**7. Connect and verify deployment**
http://<instance-public-ip>/

**8. Clean up and destroy resources**
terraform destroy -auto-approve




