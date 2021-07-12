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
         
       stage ("wait deployment AWS") {
         def time = params.SLEEP_TIME_IN_SECONDS
             echo "Waiting ${SLEEP_TIME_IN_SECONDS} seconds for deployment to complete prior starting smoke testing"
           sleep time.toInteger() // seconds
         }

        stage ('Build & run app') {
        agent any
            steps {
                sh 'sudo ansible-playbook roles.yml  -vvv'
            }

        }    
    }
        
        
}

