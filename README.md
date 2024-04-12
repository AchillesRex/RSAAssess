Here's a brief report summarizing the approach, challenges, and learnings from the technical assessment:

Approach:

The assessment required provisioning an EC2 instance on AWS, configuring Nginx, setting up a virtual host, and deploying WordPress using Docker. To accomplish these tasks, I utilized Terraform for infrastructure provisioning and Ansible for configuration management and application deployment.

    Provisioning EC2 Instance with Terraform:
        Created Terraform configuration files (main.tf, variables.tf, and output.tf) to define the AWS provider, EC2 instance, and associated resources (VPC, security group, etc.).
        Used variables to parameterize the configuration, allowing for easy modification of instance details, such as the AMI ID and instance type.
        Executed terraform init, terraform plan, and terraform apply commands to provision the EC2 instance on AWS.
    Installing and Configuring Nginx with Ansible:
        Wrote an Ansible playbook (nginx.yml) to install Nginx on the EC2 instance.
        Added tasks to start the Nginx service and verify its running status.
        Executed the playbook using the ansible-playbook command, targeting the EC2 instance specified in the inventory file (hosts.ini).
    Configuring Virtual Host on Nginx with Ansible:
        Created a separate Ansible playbook (virtualhost.yml) to configure a virtual host on Nginx.
        Defined tasks to create a new virtual host configuration file, enable the virtual host, and restart Nginx to apply the changes.
        Executed the virtualhost.yml playbook to set up the virtual host, making it accessible via the EC2 instance's public IP address.
    Deploying WordPress with Docker using Ansible:
        Wrote an Ansible playbook (wordpress.yml) to deploy WordPress using Docker containers.
        Included tasks to install Docker and Docker Compose, pull the WordPress Docker image, and configure environment variables for the WordPress container.
        Deployed a separate MySQL container and linked it with the WordPress container to provide the required database service.
        Executed the wordpress.yml playbook to deploy WordPress, making it accessible via the EC2 instance's public IP address on a different port (e.g., 8080).

Challenges and Learnings:

    SSH Connection Issues:
        Initially faced challenges with Ansible not being able to connect to the EC2 instance via SSH due to permission issues with the private key file.
        Resolved by ensuring the correct permissions were set on the private key file and specifying the correct remote user in the Ansible playbooks.
    Nginx Virtual Host Configuration:
        Encountered difficulties in accessing the configured virtual host, as the default Nginx configuration was overriding the custom virtual host settings.
    WordPress Database Connection:
        Faced issues with WordPress being unable to establish a database connection with the MySQL container.
        Troubleshooted by verifying the database credentials, installing the MySQL client within the WordPress container, and linking the containers correctly using the links section in the Ansible playbook.
    Port Conflicts:
        Experienced a port conflict between Nginx (running on port 80) and the WordPress Docker container (also trying to bind to port 80).
        Resolved by configuring the WordPress container to use a different port (e.g., 8080) or by temporarily stopping Nginx during the WordPress deployment.

Learnings and Recommendations:

Through this assessment, I gained practical experience in using Terraform for infrastructure provisioning and Ansible for configuration management and application deployment. I learned the importance of properly configuring and linking Docker containers, as well as the value of effective troubleshooting techniques when encountering issues.

For future projects, I would recommend:

    Implementing automated testing and validation of the provisioned infrastructure and deployed applications to ensure reliability and consistency.
    Exploring the use of containerized environments for Ansible execution, improving portability and reducing dependencies on the control machine.
    Investigating the use of Ansible Roles and Collections to promote code reusability and maintainability.
    Considering the use of a reverse proxy (e.g., Nginx) to manage incoming traffic and route requests to different applications, providing better flexibility and scalability.

Overall, this assessment provided valuable hands-on experience in working with Infrastructure as Code (IaC) tools, containerization, and application deployment, reinforcing the importance of automation and best practices in modern software development and operations.
