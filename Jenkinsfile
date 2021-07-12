pipeline {
    
    agent none
  
    stages {


        stage ('deploy instans to aws') {
        agent any  
            steps {
                sh 'terraform init -input=false'
                sh 'terraform plan -out=tfplan -input=false'
                sh 'terraform apply -input=false tfplan'
            } 
        }

        stage ('Build & run app') {
        agent any
            steps {
                sh 'ansible-playbook roles.yml  -vvv'
            }

        }    
    }
        
        
}

