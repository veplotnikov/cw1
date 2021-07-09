pipeline {
    
    agent none
  
    stages {


        stage ('deploy instans to aws') {
        agent any  
            steps {
                sh 'terraform init -input=false'
                sh 'terraform plan -input=false'
                sh 'terraform apply -input=false'
            } 
        }    
    }
        
        
}

