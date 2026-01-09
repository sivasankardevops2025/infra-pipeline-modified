pipeline {
    agent any

    environment {
        // Note: It is safer to store credentials in Jenkins Credentials Manager 
        // than to hardcode a token at the top of the file.
        ENV = "${env.BRANCH_NAME}"
        TF_WORKDIR = "environment/${env.BRANCH_NAME}"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: "${env.BRANCH_NAME}", 
                    url: 'https://github.com/sivasankardevops2025/infra-pipeline-modified.git'
            }
        }

        stage('Terraform Init') {
            steps {
                dir("${TF_WORKDIR}") {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir("${TF_WORKDIR}") {
                    sh 'terraform plan -out=tfplan'
                    sh 'terraform show -no-color tfplan > tfplan.txt'
                    sh 'cat tfplan.txt'
                }
            }
        }

        stage('Approval') {
            // Corrected "when" block syntax
            /*
            when {
                expression { env.BRANCH_NAME == 'production' }
            }
            */
            steps {
                input message: "Approve the deployment to production?", ok: 'Deploy'
            }
        }

        stage('Terraform Apply') {
            steps {
                dir("${TF_WORKDIR}") {
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }
    }
}