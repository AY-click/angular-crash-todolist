pipeline {
  agent any

  stages {
    stage('Build Docker Image') {
      steps {
        script {
          docker.build("ayobamid005/angular-app:${env.BUILD_NUMBER}")
        }
      }
    }

    stage('Run Docker Container') {
      steps {
        script {
          docker.image("ayobamid005/angular-app:${env.BUILD_NUMBER}").withRun('-p 8085:80') {
            // Additional steps to run tests, deploy, etc.
          }
        }
      }
    }
  }
}