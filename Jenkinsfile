#!/usr/bin/env groovy
// @Library('jenkins-shared-lib')

// without adding this lib globally in jenkins 
library identifier: 'jenkins-shared-lib@main',retriever: modernSCM(
    [$class: 'GitSCMSource',
      remote: 'https://github.com/samiselim/jenkins-shared-lib.git',
      credentialsId: 'Github_Credentials'
    ]
)
pipeline {
    agent any
    environment{
        AWS_ACCESS_KEY_ID = credentials('aws_access_key_id')
        AWS_SECRET_ACCESS_KEY = credentials('aws_access_secret_key')
    }
    stages {
        stage('Building Dokcker Images '){
            steps{
                script{
                    dockerLogin('dockerHub_cred')
                    dir('online-exam-portal'){
                            sh 'sudo docker-compose -f ./docker-compose.yaml build'
                            sh "sudo docker tag backend-app:1.0 samiselim/online-exam-portal-backend-app:1.0"
                            sh "sudo docker tag frontend-app:1.0 samiselim/online-exam-portal-frontend-app:1.0"
                            sh "sudo docker tag user-frontend-app:1.0 samiselim/online-exam-portal-user-frontend-app:1.0"
                            sh "sudo docker push samiselim/online-exam-portal-backend-app:1.0"
                            sh "sudo docker push samiselim/online-exam-portal-frontend-app:1.0"
                            sh "sudo docker push samiselim/online-exam-portal-user-frontend-app:1.0"
                        }
                    input(message: "Are you sure to Proceed" , ok: "Proceed")
                }
            }
        }
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