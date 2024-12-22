### Overview

This setup helps you easily deploy a WordPress application using AWS CloudFormation. It’s broken down into two main parts: setting up the network and setting up the application itself.<br/>
Store the following secrets in your GitHub repository:<br/>

  <br/>  DB_USER: WordPress database username.
  <br/>  DB_NAME: WordPress database name.
  <br/>  DB_PASSWORD: Password for the database.
<br/>
The flow of the setup ensures that your network is created first, followed by core application resources like the database, Secrets Manager, and ECR (Elastic Container Registry). ECS services are deployed only after the essential resources are ready.<br/>
How It Works<br/>
1. Network Setup

First, we set up the network infrastructure. This includes:<br/>

   <br/> VPC: A virtual network that isolates your resources.
   <br/> Subnets: Public and private subnets to organize and manage resources.
  <br/>  Route Tables: Control the routing between subnets and to the internet.
  <br/>  NAT Gateway: Allows private subnet resources to access the internet.
  <br/>  Internet Gateway: Gives public subnet resources access to the internet.

2. Core Application Setup

Once the network is up, we create the core resources for the application:<br/>

   <br/> RDS Database: A MySQL database to store WordPress data.
   <br/> Secrets Manager: For securely storing sensitive data like database credentials.
   <br/> ECR: A container registry where your Docker images (for WordPress) are stored.
   <br/> ECS Cluster and Service: ECS runs your WordPress containers and manages the services.

3. Deploying ECS Services

After everything else is set up, ECS services are deployed to run your WordPress application inside Docker containers. These containers pull the images stored in ECR and start running your WordPress site.<br/>
How to Deploy<br/>

   <br/> Set Up the Network:
    <br/>    First, deploy the CloudFormation template to create your VPC, subnets, NAT gateway, and other networking components.

   <br/> Create Core Resources:
        Set up the database (RDS), create a secret in Secrets Manager, and configure an ECR repository to store your Docker images.

  <br/>  Deploy ECS Services:
  <br/>      Once the network and core resources are in place, deploy your ECS services to run WordPress in containers.