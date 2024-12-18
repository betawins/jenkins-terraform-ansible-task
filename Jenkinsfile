pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('aws_credentials')  // ID from Jenkins credentials store
        AWS_SECRET_ACCESS_KEY = credentials('aws_credentials')  // ID from Jenkins credentials store
}

    stages {
        

        stage('Checkout') {
            steps {
                deleteDir()
                sh 'echo cloning repo'
                sh 'git clone https://github.com/pavantummalapalli25/jenkins-terraform-ansible-task.git' 
            }
        }
        
        stage('Terraform Apply') {
            steps {
                script {
                    dir('/var/lib/jenkins/workspace/jenkins/jenkins-terraform-ansible-task/') {
                    sh 'pwd'
                    sh 'terraform init'
                    sh 'terraform plan'
                    sh 'terraform apply -auto-approve'
                    }
                }
            }
        }
        
        stage('Ansible Deployment') {
            steps {
                script {
                   sleep '60'
                    ansiblePlaybook becomeUser: 'ec2-user', credentialsId: 'aws_credentials', disableHostKeyChecking: true, installation: 'ansible', inventory: '/var/lib/jenkins/workspace/jenkins/jenkins-terraform-ansible-task/inventory.yam', playbook: '/var/lib/jenkins/workspace/jenkins/jenkins-terraform-ansible-task/amazon-playbook.yml', vaultTmpPath: ''
                    ansiblePlaybook become: true, credentialsId: 'aws_credentials', disableHostKeyChecking: true, installation: 'ansible', inventory: '/var/lib/jenkins/workspace/jenkins/jenkins-terraform-ansible-task/inventory.yaml', playbook: '/var/lib/jenkins/workspace/jenkins/jenkins-terraform-ansible-task/ubuntu-playbook.yml', vaultTmpPath: ''
                }
            }
        }
    }
}
