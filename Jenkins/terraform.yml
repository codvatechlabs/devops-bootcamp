pipeline {
  agent any
  parameters {
    choice(
      name: 'Env',
      choices: ['Create', 'Destroy'],
      description: 'Passing the Environment'
    )
  }

  stages {
      stage('GIT_Clone') {
        steps {
        checkout changelog: false, poll: false, scm: [$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/CodvaTech-Labs/terraform-course.git']]]
           }
        }
        stage('Terraform_Setup') {
            steps {
                script {
                    if (params.Env == "Create") {
                       sh '''
                       echo "terraform create is in progress"
                       cd terraform_backend_demo
                       ls
                       terraform init -input=false
                       terraform apply --auto-approve -input=false
                       '''
                        
                    } else {
                       sh '''
                       echo "terraform destory is in progress"
                       cd terraform_backend_demo
                       terraform init -input=false
                       terraform destroy --auto-approve -input=false
                       '''                
                    }
                }
            }
        }
    
  }
}
