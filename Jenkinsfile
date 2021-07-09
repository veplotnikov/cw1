pipeline {
    
    agent none
  
    stages {

        stage ('test connections') {
        agent any
           steps {
                sshagent(credentials: ['75494825-dca3-41fc-be66-0d35138b726c']) {
            sh '''
                [ -d ~/.ssh ] || mkdir ~/.ssh && chmod 0700 ~/.ssh
                ssh-keyscan -t rsa,dsa 18.194.2.231 >> ~/.ssh/known_hosts
                ssh ubuntu@18.194.2.231  "sudo cat /etc/lsb-release >> test.txt"
            '''
            
              
                          }
            }
        }
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

