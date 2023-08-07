pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'I am in Build Phase'
            }
        }
        
        stage('Test') {
            steps {
                echo 'I am in Test Phase'
            }
        }
        
        stage('Deploy') {
            steps {
                echo 'I am in Deploy Phase'
            }
        }
        stage('VersionCheck') {
            steps {
                echo 'I am in Version Phase'
            }
        }
        stage('Monitoring') {
            steps {
               echo 'I am in monitoring phase'
            }
        }
       stage('Testing') {
            steps {
               echo 'I am in monitoring phase'
            }
        }
        stage('Slack Message') {
            steps {
                slackSend channel: '#devops-alerts',
                color: 'good',
                message: "*${currentBuild.currentResult}:* Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}\n More info at: ${env.BUILD_URL}"
                }
        }
      
    }
}
