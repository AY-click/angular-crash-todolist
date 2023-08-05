pipeline {
    agent any
    
    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', '02e3b59d-e107-42b0-8304-4cd0642c53b6') {
                        def customImage = docker.build("my-custom-image:${env.BUILD_NUMBER}")
                    }
                }
            }
        }
        
        stage('Run Docker Container') {
            steps {
                script {
                    docker.image('my-custom-image:${env.BUILD_NUMBER}').withRun('-p 8080:80') {
                        // Additional steps to run tests, deploy, etc.
                    }
                }
            }
        }
    }
}