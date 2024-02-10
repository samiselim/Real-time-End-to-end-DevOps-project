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

    }
}