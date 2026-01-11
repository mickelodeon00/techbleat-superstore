pipeline {
    agent any
    
    parameters {
        choice(
            name: 'ACTION',
            choices: ['plan', 'apply', 'destroy'],
            description: 'Select Terraform action'
        )
    }
    
    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-key')
        AWS_DEFAULT_REGION    = 'eu-west-1'
        TF_VAR_db_username    = credentials('db-username')
        TF_VAR_db_password    = credentials('db-password')
        TF_VAR_key_pair_name  = credentials('key-pair-name')
    }
    
    stages {
        stage('Terraform Init') {
            steps {
                dir('terraform') {
                    sh 'terraform init'
                }
            }
        }
        
        stage('Terraform Action') {
            steps {
                dir('terraform') {
                    script {
                        if (params.ACTION == 'plan') {
                            sh 'terraform plan'
                        } else if (params.ACTION == 'apply') {
                            sh 'terraform apply -auto-approve'
                        } else if (params.ACTION == 'destroy') {
                            sh 'terraform destroy -auto-approve'
                        }
                    }
                }
            }
        }
    }
}