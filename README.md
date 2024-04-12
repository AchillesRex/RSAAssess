# Technical Assessment Report

This document summarizes the approach, challenges, and learnings from the technical assessment involving AWS, Nginx, and WordPress deployment using Docker, Terraform, and Ansible.

## Approach

### Provisioning EC2 Instance with Terraform

- **Configuration**: Created Terraform configuration files (`main.tf`, `output.tf`, `variables.tf`) to define the AWS provider, EC2 instance, and associated resources like VPC and security group.
- **Parameterization**: Utilized variables to easily modify instance details such as the AMI ID and instance type.
- **Execution**: Ran `terraform init`, `terraform plan`, and `terraform apply` to provision the EC2 instance on AWS.

### Installing and Configuring Nginx with Ansible

- **Playbook Creation**: Developed an Ansible playbook (`nginx.yml`) to install Nginx on the EC2 instance.
- **Service Management**: Added tasks to start the Nginx service and verify its running status.
- **Deployment**: Executed the playbook using `ansible-playbook`, targeting the EC2 instance defined in the inventory file (`hosts.ini`).

### Configuring Virtual Host on Nginx with Ansible

- **Virtual Host Setup**: Created a separate playbook (`virtualhost.yml`) to configure a virtual host on Nginx.
- **Configuration Tasks**: Defined tasks to create a new virtual host configuration file, enable it, and restart Nginx.
- **Execution**: Ran the `virtualhost.yml` playbook to set up the virtual host accessible via the public IP.

### Deploying WordPress with Docker using Ansible

- **Playbook Development**: Authored an Ansible playbook (`wordpress.yml`) for deploying WordPress using Docker.
- **Docker Configuration**: Included tasks to install Docker and Docker Compose, pull the WordPress image, and set environment variables.
- **Database Setup**: Deployed a MySQL container and linked it with the WordPress container.
- **Execution**: Deployed WordPress accessible on port 8080 using the `wordpress.yml` playbook.

## Challenges and Learnings

### SSH Connection Issues

- **Problem**: Difficulty with SSH connections to EC2 due to permission issues on the private key file.
- **Resolution**: Adjusted permissions on the key file and configured the remote user in Ansible correctly.

### Nginx Virtual Host Configuration

- **Problem**: Custom virtual host settings were overridden by the default Nginx configuration.
- **Resolution**: Configured Nginx to prioritize the virtual host settings.

### WordPress Database Connection

- **Problem**: WordPress could not establish a database connection with the MySQL container.
- **Resolution**: Verified database credentials and linked the containers properly.

### Port Conflicts

- **Problem**: Conflict between Nginx and WordPress both attempting to bind to port 80.
- **Resolution**: Configured WordPress to use a different port or stopped Nginx temporarily.

## Recommendations

- **Automated Testing**: Implement testing and validation of infrastructure and applications for reliability.
- **Containerized Ansible**: Use containerized environments for Ansible to reduce dependencies.
- **Ansible Best Practices**: Explore Ansible Roles and Collections for code reusability.
- **Reverse Proxy Usage**: Consider using Nginx as a reverse proxy for better traffic management and scalability.

## Conclusion

This assessment provided invaluable hands-on experience with IaC tools, containerization, and deployment, highlighting the importance of automation and best practices in software development and operations.
