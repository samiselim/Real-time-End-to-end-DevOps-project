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
            }
            steps{
                script{
                   dir('EKS_Cluster'){
                    sh 'terraform plan'
                   }
                   input(message: "Are you sure to Proceed" , ok: "Proceed")
                }
            }
        }
         stage('Provisioning the Infrastructure |  creating EKS cluster'){
            environment{
                TF_VAR_vpc_cidr = "192.168.0.0/16"
            }
            steps{
                script{
                    def choice = input message: "Apply or Destroy Infrastructure", ok: "Done", parameters: [choice(name: 'ONE', choices: ['apply', 'destroy'], description: '')]
                    dir('EKS_Cluster'){
                        sh "terraform $choice --auto-approve"
                   }
                }
            }
        }

    }
}