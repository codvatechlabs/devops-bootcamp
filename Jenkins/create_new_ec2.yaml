pipeline {
  agent any
  stages {
    stage('GIT_Clone') {
      steps {
        checkout changelog: false, poll: false, scm: [$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/codvatechlabs/tf-jenkins.git']]]
           }
    }
    stage('Terraform_Apply') {
      steps {
        sh "terraform init -input=false"
        sh "terraform plan -input=false"
        sh "terraform apply --auto-approve -input=false"
      }
    }
    
  }
}
    
