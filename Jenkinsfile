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
            steps {
             echo 'Waiting 3 minutes for deployment to complete install software..'
             sleep 180
             }
          }

        stage ('Build & run app') {
        agent any
            steps {
                sh 'sudo ansible-playbook roles.yml  -vvv'
            }

        }    
    }
        
        
}
