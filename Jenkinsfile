pipeline {
    agent any
    
    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', '4c3886fb-f1c6-42aa-8ba2-36a5114867cd') {
                        def customImage = docker.build("my-docker-image:${env.BUILD_NUMBER}")
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
                stage ('login') {
                    
                    ps {
                        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIAL_USR --password-stdin'
                    }
                }
            }
        }
    }
}