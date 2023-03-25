pipeline {
  agent {
    node {
      label 'iac'
    }

  }
  stages {
    stage('Checkout') {
      agent {
        node {
          label 'iac'
        }

      }
      steps {
        checkout(scm: [$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/justb1swa/izac2run.git']]], changelog: true)
      }
    }

    stage('Build Now') {
      steps {
        sh 'echo $AWS_ACCESS_KEY_ID'
        sh 'echo $AWS_SECRET_ACCESS_KEY'
        sh 'echo $AWS_SESSION_TOKEN'
      }
    }

    stage('Initialize Terraform ') {
      steps {
        sh 'terraform init -input=false'
      }
    }

    stage('Terraform in Action') {
      steps {
        sh 'terraform apply -input=false -compact-warnings -auto-approve'
      }
    }

  }
}