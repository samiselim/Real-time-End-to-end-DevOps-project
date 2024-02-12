# Online Exam Portal Deployment Pipeline

This project sets up a deployment pipeline for an Online Exam Portal using Jenkins, Docker, Terraform, and Kubernetes (EKS). The pipeline includes building Docker images, initializing and provisioning infrastructure with Terraform, and deploying the application to an EKS cluster.

## Prerequisites

Before you begin, ensure you have the following tools and credentials set up:

- Jenkins with Shared Library configured
- Docker
- Terraform
- AWS CLI
- AWS Access Key ID and Secret Access Key
- DockerHub credentials

## Project Structure

- `Jenkinsfile`: Jenkins pipeline script.
- `EKS_Cluster/`: Terraform files for setting up the EKS cluster.
- `online-exam-portal/`: Docker Compose file and application source code.
- `EKS_Cluster/K8s_ConfigurationFiles/`: Kubernetes configuration files.

## Jenkins Pipeline Stages

1. **Building Docker Images:**
   - Build Docker images for the application components.
   - Tag and push the images to DockerHub.

2. **Initializing Terraform:**
   - Initialize Terraform in the `EKS_Cluster` directory.

3. **Formatting Terraform Code:**
   - Format Terraform code in the `EKS_Cluster` directory.

4. **Validating Terraform:**
   - Validate Terraform code in the `EKS_Cluster` directory.

5. **Planning and Reviewing Infrastructure:**
   - Perform a Terraform plan for infrastructure changes.
   - Confirm the changes before proceeding.

6. **Provisioning the Infrastructure (Creating EKS Cluster):**
   - Apply or destroy the infrastructure changes using Terraform.

7. **Logging in AWS Account using Kubectl:**
   - Configure AWS CLI credentials and update Kubeconfig for EKS cluster.

8. **Deploying the Application:**
   - Apply Kubernetes configurations to deploy MongoDB, Mongo Express, Backend, and Frontend components.

## Usage

1. Create a Jenkins pipeline job and configure the necessary credentials.
2. Run the pipeline job, providing input when prompted.
3. Monitor the Jenkins console output for progress and confirmations.
4. Access the deployed application on the EKS cluster.

## Notes

- Ensure you have the required permissions for AWS and DockerHub.
- Review and customize Terraform variables in `EKS_Cluster/terraform.tfvars`.
- Adjust Kubernetes configuration files in `EKS_Cluster/K8s_ConfigurationFiles/` as needed.

Feel free to contribute, report issues, or suggest improvements!
