pipeline {
    agent any
    environment{
        AWS_ACCESS_KEY_ID = credentials('aws_access_key_id')
        AWS_SECRET_ACCESS_KEY = credentials('aws_access_secret_key')
    }
    stages {
        stage('Initializing Terraform '){
            steps{
                script{
                   dir('EKS_Cluster'){
                    sh 'terraform init'
                   }
                }
            }
        }
        stage('Formatting Terraform Code'){
            steps{
                script{
                   dir('EKS_Cluster'){
                    sh 'terraform fmt'
                   }
                }
            }
        }
        stage('validating Terraform '){
            steps{
                script{
                   dir('EKS_Cluster'){
                    sh 'terraform validate'
                   }
                }
            }
        }
        stage('Planning and reviewing Infrastructure '){
            environment{
                TF_VAR_vpc_cidr = "192.168.0.0/16"
                TF_VAR_public_subnets="['192.168.1.0/24', '192.168.2.0/24', '192.168.3.0/24']"
                TF_VAR_private_subnets="['192.168.4.0/24', '192.168.5.0/24', '192.168.6.0/24']"  

            }
            steps{
                script{
                   dir('EKS_Cluster'){
                    sh 'terraform plan'
                   }
                }
            }
        }

    }
}