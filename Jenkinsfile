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
         
        stage ('wait deployment AWS') {
           echo 'Waiting 5 minutes for deployment to complete prior starting smoke testing'
           sleep 300
          }

        stage ('Build & run app') {
        agent any
            steps {
                sh 'sudo ansible-playbook roles.yml  -vvv'
            }

        }    
    }
        
        
}

("wait_prior_starting_smoke_testing") {
  echo 'Waiting 5 minutes for deployment to complete prior starting smoke testing'