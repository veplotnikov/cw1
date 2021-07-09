pipeline {
    
    agent none
  
    stages {

        stage ('test connections') {
        agent any
        
            steps {
                sshagent(credentials: ['75494825-dca3-41fc-be66-0d35138b726c']) {
            sh 'ssh ubuntu@18.194.2.231  "sudo cat /etc/lsb-release >> /test.txt"'
              '''  [ -d ~/.ssh ] || mkdir ~/.ssh && chmod 0700 ~/.ssh
                ssh-keyscan -t rsa,dsa example.com >> ~/.ssh/known_hosts '''
                          }
            }
        }
        
        
    }
}
