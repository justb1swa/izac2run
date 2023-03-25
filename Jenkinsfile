pipeline {
  agent {
    node {
      label 'iac'
    }
  }
     stages {
        stage('Checkout') {
            steps {
            checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/justb1swa/izac2run.git']]])            

          }
        }
        stage ("Build Now") {
            steps {
                sh 'echo $AWS_ACCESS_KEY_ID'
		sh 'echo $AWS_SECRET_ACCESS_KEY'
		sh 'echo $AWS_SESSION_TOKEN' 
            }
        }
        stage ("Initialize Terraform ") {
            steps {
                sh ('terraform init -input=false') 
            }
        }
        
        stage ("Terraform in Action") {
            steps {
                echo "Terraform action  --> ${action}"
                sh ('terraform ${action} -compact-warnings --auto-approve') 
           }
        }
    }
}
