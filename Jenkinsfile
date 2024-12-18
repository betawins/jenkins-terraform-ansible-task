pipeline {
    agent any

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
 main
                   sleep '150'
                    ansiblePlaybook becomeUser: 'ec2-user', credentialsId: 'amazon_linux', disableHostKeyChecking: true, installation: 'ansible', inventory: '/var/lib/jenkins/workspace/jenkins/jenkins-terraform-ansible-task/inventory.yam', playbook: '/var/lib/jenkins/workspace/jenkins/jenkins-terraform-ansible-task/amazon-playbook.yml', vaultTmpPath: ''
                    ansiblePlaybook become: true, credentialsId: 'ubuntu', disableHostKeyChecking: true, installation: 'ansible', inventory: '/var/lib/jenkins/workspace/jenkins/jenkins-terraform-ansible-task/inventory.yaml', playbook: '/var/lib/jenkins/workspace/jenkins/jenkins-terraform-ansible-task/ubuntu-playbook.yml', vaultTmpPath: ''
=======
                   sleep '360'
                    ansiblePlaybook becomeUser: 'ec2-user', credentialsId: 'amazonlinux', disableHostKeyChecking: true, installation: 'ansible', inventory: '/var/lib/jenkins/workspace/ansible-tf/ansible-task/inventory.yaml', playbook: '/var/lib/jenkins/workspace/ansible-tf/ansible-task/amazon-playbook.yml', vaultTmpPath: ''
                    ansiblePlaybook become: 'ubuntu', credentialsId: 'ubuntuuser', disableHostKeyChecking: true, installation: 'ansible', inventory: '/var/lib/jenkins/workspace/ansible-tf/ansible-task/inventory.yaml', playbook: '/var/lib/jenkins/workspace/ansible-tf/ansible-task/ubuntu-playbook.yml', vaultTmpPath: ''
 main
                }
            }
        }
    }
}
